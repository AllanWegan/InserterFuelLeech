---@meta _

--$Factorio 2.0.9
--$Generator 1.1.47
--$Section runtime-api/LuaVoidEnergySourcePrototype
-- This file is automatically generated. Edits will be overwritten without warning.

do
---Prototype of a void energy source.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaVoidEnergySourcePrototype.html)
---@class LuaVoidEnergySourcePrototype:LuaObject
---The table of emissions of this energy source in `pollution/Joule`, indexed by pollutant type. Multiplying it by energy consumption in `Watt` gives `pollution/second`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaVoidEnergySourcePrototype.html#emissions_per_joule)
---@field emissions_per_joule {[string]:double}
---The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaVoidEnergySourcePrototype.html#object_name)
---@field object_name string
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaVoidEnergySourcePrototype.html#render_no_network_icon)
---@field render_no_network_icon boolean
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaVoidEnergySourcePrototype.html#render_no_power_icon)
---@field render_no_power_icon boolean
---Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaVoidEnergySourcePrototype.html#valid)
---@field valid boolean
local LuaVoidEnergySourcePrototype={
}
end
