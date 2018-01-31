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
  initSettingsCache()
  local inserter = event.created_entity
  if inserter.type == "inserter" then
    local inserters_a = get_table_u(global, "inserters_a")
    local inserters_count = get_table_u(global, "inserters_count", 0)
    table.insert(inserters_a, inserter)
    global.inserters_count = inserters_count + 1
    --[[cust_log("Added inserter.", {
      inserter = inserter,
      name = inserter.name,
      position = inserter.position,
    })--]]
  end
end

function process_inserters()
  initSettingsCache()
  local inserters_a = get_table(global, "inserters_a")
  local inserters_b = get_table(global, "inserters_b")
  local inserters_count = get_val_u(global, "inserters_count", 0)
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
    if inserter.valid then -- Don't keep or check deconstructed inserter.
      table.insert(inserters_b, inserter)
      process_inserter(inserter)
    else
      inserters_count = inserters_count - 1
      --cust_log("Removed inserter.", {inserter=inserter})
    end
    i = i + 1
  end
  global.inserters_count = inserters_count
end

function process_inserter(inserter)

  -- Skip if unpowered:
  if not is_powered(inserter) then
    return
  end

  -- Only change behaviour for grabbing from another entity:
  local source = pickup_target_of_inserter(inserter)
  if not source or not source.burner then
    return
  end
  
  -- Teleport-leech a fuel item if cheat enabled and way too low on fuel:
  if inserter_self_refuel_cheat(inserter, source) then
    return
  end

  -- Check for empty hand and hovering over pickup location:
  if inserter.held_stack.valid_for_read
  or not inserter_is_at_pickup_pos(inserter) then
    return
  end

  -- Grab fuel for self or target:
  if not inserter_leech_fuel(inserter, source.burner, inserter.burner, 1) then
    local target = inserter.drop_target
    if target then
      inserter_leech_fuel(inserter, source.burner, target.burner)
    end
  end
  
end

function inserter_self_refuel_cheat(inserter, source)
  local burner = inserter.burner
  if settingsCache.self_refuel_cheat_enabled
  and burner and burner.inventory.is_empty()
  and burner.remaining_burning_fuel <= settingsCache.self_refuel_cheat_fuel then
    local source_fuel = source.burner.inventory
    
    -- Find first stack of grabable fuel usable by our burner:
    local source_stack = first_movable_stack_of_inventory_by_fuel_cats(
      source_fuel, inserter, burner.fuel_categories)
    if not source_stack then
      return true
    end
    
    -- Teleport one fuel item into burner fuel inventory:
    local stack_def = {name=source_stack.name, count=1}
    stack_def.count = source_fuel.remove(stack_def)
    if stack_def.count == 0 then
      return true
    end
    --[[cust_log("cheat-refuelled", {
      inserter = inserter,
      position = inserter.position,
      remaining_fuel = burner.remaining_burning_fuel,
    })--]]
    burner.inventory.insert(stack_def)
    
    return true
  end
  return false
end

function inserter_is_at_pickup_pos(inserter)
  -- Quick and dirty check for hand hovering over pickup position.
  local hand_pos = inserter.held_stack_position
  local pickup_pos = inserter.pickup_position
  local hand_x, hand_y = hand_pos.x, hand_pos.y
  local pickup_x, pickup_y = pickup_pos.x, hand_pos.y
  local max_variation = settingsCache.pickup_pos_variation
  return ( -- Inaccurate, but cheap:
    math.abs(hand_x - pickup_x) <= max_variation
    and math.abs(hand_y - pickup_y) <= max_variation
  )
end

function inserter_leech_fuel(inserter, source_burner, dest_burner, min_count)
  if not source_burner or not dest_burner then
    return false
  end
  local source_fuel = source_burner.inventory
  local dest_fuel = dest_burner.inventory
  if source_fuel.is_empty() or not needs_refuelling(dest_fuel, min_count) then
    return false
  end
  
  -- Find first stack of grabable fuel usable by destination burner:
  local fuel_cats = dest_burner.fuel_categories
  local source_stack = first_movable_stack_of_inventory_by_fuel_cats(
    source_fuel, inserter, fuel_cats)
  if not source_stack then
    return false
  end
  
  -- Grab as much of the fuel as possible:
  local name, count = source_stack.name, stack_size_of_inserter(inserter)
  count = source_fuel.remove{name=name, count=count}
  if count == 0 then
    return false
  end
  inserter.held_stack.set_stack{name=name, count=count}
  
  return true
end

function needs_refuelling(fuel_inv, min_count)
  if not fuel_inv then
    return false
  end
  if not min_count then
    min_count = settingsCache.min_fuel_items
  end
  local count = 0
  for i = 1, # fuel_inv, 1 do
    local stack = fuel_inv[i]
    if stack and stack.valid_for_read then
      count = count + stack.count
      if count >= min_count then
        return false
      end
    end
  end
  return true
end

function first_movable_stack_of_inventory_by_fuel_cats(inventory, mover
, fuel_cats)
  return first_stack_of_inventory_by_guard(inventory, function(stack)
    return is_movable_stack_of_fuel(stack, mover, fuel_cats)
  end)
end

function is_movable_stack_of_fuel(stack, mover, fuel_cats)
  local name = stack.name
  return (not mover or is_item_allowed_by_mover_filter(mover, name))
  and (not fuel_cats or is_item_of_fuel_cats(name, fuel_cats))
end

function first_stack_of_inventory_by_guard(inventory, guard_fun)
  if not inventory then
    return nil
  end
  for i = 1, # inventory, 1 do
    local stack = inventory[i]
    if stack and stack.valid_for_read and stack.count ~= 0
    and guard_fun(stack) then
      return stack
    end
  end
  return nil
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

function is_item_of_fuel_cats(name, fuel_cats)
  local proto = game.item_prototypes[name]
  local fuel_cat = proto and proto.fuel_category
  if fuel_cat then
    return fuel_cats[fuel_cat] == true
  end
  return false
end

function pickup_target_of_inserter(inserter)
  local entity = inserter.pickup_target
  if not entity then
    -- Inserters only know a pickup target if the entity at pickup_position has
    -- a regular inventory.
    local entities = inserter.surface.find_entities_filtered{
      position=inserter.pickup_position}
    if # entities ~= 0 then
      entity = entities[1]
    end
  end
  return entity
end

function stack_size_of_inserter(inserter)
  local def_stack_size = default_stack_size_of_inserter(inserter)
  local set_stack_size = inserter.inserter_stack_size_override
  if set_stack_size == 0 or def_stack_size < set_stack_size then
    return def_stack_size
  end
  return set_stack_size
end

function default_stack_size_of_inserter(inserter)
  if inserter.prototype.stack then
    return 1 + inserter.force.stack_inserter_capacity_bonus
  end
  return 1 + inserter.force.inserter_stack_size_bonus
end

function is_powered(entity)
  return not entity.energy or entity.energy ~= 0
end

function get_val_u(obj, name, default)
  -- Like get_val, but sets obj[name] to default if the property does not exist.
  local value = obj[name]
  if value ~= nil then
    return value
  end
  obj[name] = default
  return default
end

function get_table(obj, name)
  local value = obj[name]
  if value ~= nil then
    return value
  end
  return {}
end

function get_table_u(obj, name)
  -- Like get_table, but sets obj[name] to the returned empty table if the
  -- property does not exist.
  local value = obj[name]
  if value ~= nil then
    return value
  end
  value = {}
  obj[name] = value
  return value
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
  val = settings.global["inserter-fuel-leech-self-refuel-cheat-fuel"].value
  settingsCache.self_refuel_cheat_fuel = val
end

script.on_event(defines.events.on_tick, process_inserters)
script.on_event(defines.events.on_built_entity, on_any_build)
script.on_event(defines.events.on_robot_built_entity, on_any_build)
