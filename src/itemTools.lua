--[[
This file is part of the mod InserterFuelLeech that is licensed under the
GNU GPL-3.0. See the file COPYING for a copy of the GNU GPLv3.0.
]]

---@param itemId ItemID
---@return string
function itemIdToName(itemId)
    if type(itemId) =="string" then
        return itemId
    end
    return itemId.name
end

--- @type EntitySearchFilters
local itemsOnGroundFilter = { position = nil, name = "item-on-ground", radius = nil}

--- Might return the wrong entity when called in same tick the inserter was created in.
--- @param surface LuaSurface
--- @param mapPosition MapPosition
--- @param radius number
--- @return LuaItemStack[]
function getItemsOnGround(surface, mapPosition, radius)
    -- Inserters only know a pickup target if the entity at pickup_position has a regular inventory.
    itemsOnGroundFilter.position = mapPosition
    itemsOnGroundFilter.radius = radius
    return surface.find_entities_filtered(itemsOnGroundFilter)
end

--- @param itemName string
--- @param matchingFuelCategories table<string,true>?
--- @return boolean
function isMatchingFuelItem(itemName, matchingFuelCategories)
    if not matchingFuelCategories then
        return false
    end
    local itemPrototype = prototypes.item[itemName]
    if not itemPrototype then
        return false
    end
    local itemFuelCategories = prototypes.item[itemName].fuel_categories
    if not itemFuelCategories then
        return false
    end
    for _, fuelCategory in ipairs(itemFuelCategories) do
        if matchingFuelCategories[fuelCategory] then
            return true
        end
    end
    return false
end
