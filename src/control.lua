--[[
This file is part of the mod InserterFuelLeech that is licensed under the
GNU GPL-3.0. See the file COPYING for a copy of the GNU GPLv3.0.
]]

local settingsCache = nil

function cust_log(msg, data)
    if type(msg) ~= "string" then
        msg = serpent.line(msg)
    end
    msg = tostring(game.tick) .. " " .. script.mod_name .. ": " .. msg
    if data then
        if type(data) == "table" then
            local sep = " "
            for k, v in pairs(data) do
                local label
                if type(k) == "number" then
                    label = ""
                elseif type(k) == "string" then
                    label = k .. ": "
                else
                    label = serpent.line(k) .. ": "
                end
                msg = msg .. sep .. label .. serpent.line(v)
                sep = "; "
            end
        else
            msg = msg .. " data: " .. serpent.line(data)
        end
    end
    print(msg)
end

function on_any_build(event)
    local inserter = event.created_entity
    if inserter.type == "inserter" then
        table.insert(global.inserters_a, inserter)
        global.inserters_count = global.inserters_count + 1
        --[[cust_log("Added inserter.", {
        inserter = inserter,
        name = inserter.name,
        position = inserter.position,
        })--]]
    end
end

function process_inserters()
    local inserters_a = global.inserters_a
    local inserters_b = global.inserters_b
    local inserters_count = global.inserters_count
    local count_to_check = inserters_count / settingsCache.ticks_between_updates
    local i = 0
    while i < count_to_check do
        local inserter = table.remove(inserters_a)
        if inserter == nil then
            -- Full update complete. Start with first inserter next time:
            global.inserters_a = inserters_b
            global.inserters_b = {}
            break
        end
        if inserter.valid then
            table.insert(inserters_b, inserter)
            process_inserter(inserter)
        else
            -- Don't keep or check deconstructed inserter.
            inserters_count = inserters_count - 1
            global.inserters_count = inserters_count
            --cust_log("Removed inserter.", {inserter=inserter})
        end
        i = i + 1
    end
end

function process_inserter(inserter)

    -- Handle unpowered inserters:
    if inserter.energy == 0 then
        if inserter.burner and settingsCache.self_refuel_cheat_enabled then
            inserter_cheat_fuel(inserter)
        end
        return
    end

    -- Grab fuel for target:
    if not inserter.held_stack.valid_for_read
    and inserter.drop_target and inserter.drop_target.burner
    and inserter_is_at_pickup_pos(inserter) then
        local source = pickup_target_of_inserter(inserter)
        if source and source.burner then
            local src_fuel = source.burner.inventory
            local dest_fuel = inserter.drop_target.burner.inventory
            if src_fuel and not src_fuel.is_empty()
            and dest_fuel and needs_refuelling(dest_fuel) then
                inserter_leech_fuel(src_fuel, inserter, dest_fuel)
            end
        end
    end

end

function inserter_cheat_fuel(inserter)
    local burner = inserter.burner
    for fuel_cat, v in pairs(burner.fuel_categories) do
        for k, proto in pairs(game.get_filtered_item_prototypes({
            {filter = "fuel-category", ["fuel-category"] = fuel_cat},
            {mode = "and", filter = "fuel-value", comparison = ">", value = 0.0}
        })) do
            burner.currently_burning = proto.name
            burner.remaining_burning_fuel = 5000

            -- Tell the engine to update the inserter's internal state:
            inserter.active = false
            inserter.active = true
            return
        end
    end
end

function inserter_leech_fuel(src_fuel, inserter, dest_fuel)

    -- Find first stack of grabable fuel usable by destination burner:
    local src_stack = get_first_movable_stack(src_fuel, inserter, dest_fuel)
    if not src_stack then
        return false
    end

    -- Grab as much of the fuel as possible and fitting into target:
    local count = math.min(src_stack.count, stack_size_of_inserter(inserter))
    local stack = {name=src_stack.name, count=count}
    stack.count = src_fuel.remove(stack)
    if stack.count == 0 then
        return false
    end
    inserter.held_stack.set_stack(stack)

    return true
end

function teleport_stack(src_inv, stack_def, dst_inv)
    stack_def.count = src_inv.remove(stack_def)
    if stack_def.count == 0 then
        return false
    end
    dst_inv.insert(stack_def)
    return true
end

function inserter_is_at_pickup_pos(inserter)
    -- Quick and dirty check for hand hovering over pickup position.
    local hand_pos = inserter.held_stack_position
    local pickup_pos = inserter.pickup_position
    local max_variation = settingsCache.pickup_pos_variation
    return ( -- Inaccurate, but cheap:
        math.abs(hand_pos.x - pickup_pos.x) <= max_variation
        and math.abs(hand_pos.y - pickup_pos.y) <= max_variation
    )
end

function needs_refuelling(fuel_inv)
    local min_count = settingsCache.min_fuel_items
    local count = 0
    local stack
    for i = 1, #fuel_inv, 1 do
        stack = fuel_inv[i]
        if stack and stack.valid_for_read then
            count = count + stack.count
            if count >= min_count then
                return false
            end
        end
    end
    return true
end

function get_first_movable_stack(src_inv, mover, dst_inv)
    local count, stack
    for i = 1, #src_inv, 1 do
        stack = src_inv[i]
        if stack and stack.valid_for_read and stack.count ~= 0
        and is_item_allowed_by_mover_filter(mover, stack.name) then
            count = dst_inv.get_insertable_count(stack.name)
            if count ~= 0 then
                return {name=stack.name, count=math.min(stack.count, count)}
            end
        end
    end
end

function is_item_allowed_by_mover_filter(item_mover, item_name)
    local is_filtered = false
    for i = 1, item_mover.filter_slot_count, 1 do
        local filter_name = item_mover.get_filter(i)
        if filter_name then
            if filter_name == item_name then
                return true
            end
            is_filtered = true
        end
    end
    return not is_filtered
end

function pickup_target_of_inserter(inserter)
    local entity = inserter.pickup_target
    if entity then
        return entity
    end
    -- Inserters only know a pickup target if the entity at
    -- pickup_position has a regular inventory.
    local entities = inserter.surface.find_entities_filtered{
    position=inserter.pickup_position}
    return entities[1] -- Returns nil if none found
end

function stack_size_of_inserter(inserter)
    local def_stack_size = 1
    if inserter.prototype.stack then
        def_stack_size = def_stack_size
        + inserter.force.stack_inserter_capacity_bonus
    else
        def_stack_size = def_stack_size
        + inserter.force.inserter_stack_size_bonus
    end
    local set_stack_size = inserter.inserter_stack_size_override
    if set_stack_size == 0 or def_stack_size < set_stack_size then
        return def_stack_size
    end
    return set_stack_size
end

function initSettingsCache()
    settingsCache = {}
    val = settings.global["inserter-fuel-leech-pickup-pos-variation"].value
    settingsCache.pickup_pos_variation = val
    val = settings.global["inserter-fuel-leech-ticks-between-updates"].value
    settingsCache.ticks_between_updates = val
    val = settings.global["inserter-fuel-leech-min-fuel-items"].value
    settingsCache.min_fuel_items = val
    val = settings.global["inserter-fuel-leech-self-refuel-cheat-enabled"].value
    settingsCache.self_refuel_cheat_enabled = val
end

script.on_init(function()
    global.inserters_a = {}
    global.inserters_b = {}
    global.inserters_count = 0
    initSettingsCache()
end)
script.on_load(function()
    initSettingsCache()
end)
script.on_configuration_changed(function(data)
    initSettingsCache()
end)
script.on_event(defines.events.on_runtime_mod_setting_changed, function(data)
    initSettingsCache()
end)

script.on_event(defines.events.on_tick, process_inserters)
script.on_event(defines.events.on_built_entity, on_any_build)
script.on_event(defines.events.on_robot_built_entity, on_any_build)
