---@meta _

--$Factorio 2.0.9
--$Generator 1.1.47
--$Section runtime-api/LuaBurner
-- This file is automatically generated. Edits will be overwritten without warning.

do
---A reference to the burner energy source owned by a specific [LuaEntity](https://lua-api.factorio.com/latest/classes/LuaEntity.html) or [LuaEquipment](https://lua-api.factorio.com/latest/classes/LuaEquipment.html).
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaBurner.html)
---@class LuaBurner:LuaObject
---The burnt result inventory.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaBurner.html#burnt_result_inventory)
---@field burnt_result_inventory LuaInventory
---The currently burning item. Writing `nil` will void the currently burning item without producing a [LuaBurner::burnt\_result](https://lua-api.factorio.com/latest/classes/LuaBurner.html#burnt_result).
---
---Writing to this automatically handles correcting [LuaBurner::remaining\_burning\_fuel](https://lua-api.factorio.com/latest/classes/LuaBurner.html#remaining_burning_fuel).
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaBurner.html#currently_burning)
---@field currently_burning? ItemWithQualityID
---The fuel categories this burner uses.
---
---The value in the dictionary is meaningless and exists just to allow for easy lookup.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaBurner.html#fuel_categories)
---@field fuel_categories {[string]:true}
---The current heat (energy) stored in this burner.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaBurner.html#heat)
---@field heat double
---The maximum heat (maximum energy) that this burner can store.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaBurner.html#heat_capacity)
---@field heat_capacity double
---The fuel inventory.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaBurner.html#inventory)
---@field inventory LuaInventory
---The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaBurner.html#object_name)
---@field object_name string
---The owner of this burner energy source
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaBurner.html#owner)
---@field owner (LuaEntity)|(LuaEquipment)
---The amount of energy left in the currently-burning fuel item.
---
---Writing to this will silently do nothing if there's no [LuaBurner::currently\_burning](https://lua-api.factorio.com/latest/classes/LuaBurner.html#currently_burning) set.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaBurner.html#remaining_burning_fuel)
---@field remaining_burning_fuel double
---Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaBurner.html#valid)
---@field valid boolean
local LuaBurner={
}
end
