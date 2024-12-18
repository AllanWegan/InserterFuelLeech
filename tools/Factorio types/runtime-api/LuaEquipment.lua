---@meta _

--$Factorio 2.0.9
--$Generator 1.1.47
--$Section runtime-api/LuaEquipment
-- This file is automatically generated. Edits will be overwritten without warning.

do
---@class LuaEquipment.shape
---@field width uint
---@field height uint
local LuaEquipment_shape={
}
end

do
---An item in a [LuaEquipmentGrid](https://lua-api.factorio.com/latest/classes/LuaEquipmentGrid.html), for example a fusion reactor placed in one's power armor.
---
---An equipment reference becomes invalid once the equipment is removed or the equipment grid it resides in is destroyed.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html)
---@class LuaEquipment:LuaObject
---The burner energy source for this equipment, if any.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#burner)
---@field burner? LuaBurner
---Current available energy.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#energy)
---@field energy double
---Energy generated per tick.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#generator_power)
---@field generator_power double
---Name of the equipment contained in this ghost
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#ghost_name)
---
---*Can only be used if this is Ghost*
---@field ghost_name string
---The prototype of the equipment contained in this ghost.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#ghost_prototype)
---
---*Can only be used if this is Ghost*
---@field ghost_prototype LuaEquipmentPrototype
---Type of the equipment contained in this ghost.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#ghost_type)
---
---*Can only be used if this is Ghost*
---@field ghost_type string
---Maximum amount of energy that can be stored in this equipment.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#max_energy)
---@field max_energy double
---Maximum shield value.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#max_shield)
---@field max_shield double
---Maximum solar power generated.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#max_solar_power)
---@field max_solar_power double
---Movement speed bonus.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#movement_bonus)
---@field movement_bonus double
---Name of this equipment.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#name)
---@field name string
---The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#object_name)
---@field object_name string
---Position of this equipment in the equipment grid.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#position)
---@field position EquipmentPosition
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#prototype)
---@field prototype LuaEquipmentPrototype
---Quality of this equipment.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#quality)
---@field quality LuaQualityPrototype
---Shape of this equipment.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#shape)
---@field shape LuaEquipment.shape
---Current shield value of the equipment.
---
---Can't be set higher than [LuaEquipment::max\_shield](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#max_shield).
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#shield)
---@field shield double
---If this equipment is marked to be removed.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#to_be_removed)
---@field to_be_removed boolean
---Type of this equipment.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#type)
---@field type string
---Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaEquipment.html#valid)
---@field valid boolean
local LuaEquipment={
}
end

