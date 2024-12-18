---@meta _

--$Factorio 2.0.9
--$Generator 1.1.47
--$Section runtime-api/LuaFluidEnergySourcePrototype
-- This file is automatically generated. Edits will be overwritten without warning.

do
---Prototype of a fluid energy source.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFluidEnergySourcePrototype.html)
---@class LuaFluidEnergySourcePrototype:LuaObject
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFluidEnergySourcePrototype.html#burns_fluid)
---@field burns_fluid boolean
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFluidEnergySourcePrototype.html#destroy_non_fuel_fluid)
---@field destroy_non_fuel_fluid boolean
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFluidEnergySourcePrototype.html#effectivity)
---@field effectivity double
---The table of emissions of this energy source in `pollution/Joule`, indexed by pollutant type. Multiplying it by energy consumption in `Watt` gives `pollution/second`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFluidEnergySourcePrototype.html#emissions_per_joule)
---@field emissions_per_joule {[string]:double}
---The fluid box for this energy source.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFluidEnergySourcePrototype.html#fluid_box)
---@field fluid_box LuaFluidBoxPrototype
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFluidEnergySourcePrototype.html#fluid_usage_per_tick)
---@field fluid_usage_per_tick double
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFluidEnergySourcePrototype.html#maximum_temperature)
---@field maximum_temperature double
---The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFluidEnergySourcePrototype.html#object_name)
---@field object_name string
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFluidEnergySourcePrototype.html#render_no_network_icon)
---@field render_no_network_icon boolean
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFluidEnergySourcePrototype.html#render_no_power_icon)
---@field render_no_power_icon boolean
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFluidEnergySourcePrototype.html#scale_fluid_usage)
---@field scale_fluid_usage boolean
---The smoke sources for this prototype, if any.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFluidEnergySourcePrototype.html#smoke)
---@field smoke (SmokeSource)[]
---Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFluidEnergySourcePrototype.html#valid)
---@field valid boolean
local LuaFluidEnergySourcePrototype={
}
end

