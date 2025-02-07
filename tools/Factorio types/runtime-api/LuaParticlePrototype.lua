---@meta _

--$Factorio 2.0.9
--$Generator 1.1.47
--$Section runtime-api/LuaParticlePrototype
-- This file is automatically generated. Edits will be overwritten without warning.

do
---Prototype of an optimized particle.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaParticlePrototype.html)
---@class LuaParticlePrototype:LuaPrototypeBase
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaParticlePrototype.html#ended_in_water_trigger_effect)
---@field ended_in_water_trigger_effect TriggerEffectItem
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaParticlePrototype.html#ended_on_ground_trigger_effect)
---@field ended_on_ground_trigger_effect TriggerEffectItem
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaParticlePrototype.html#fade_out_time)
---@field fade_out_time uint
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaParticlePrototype.html#life_time)
---@field life_time uint
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaParticlePrototype.html#mining_particle_frame_speed)
---@field mining_particle_frame_speed float
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaParticlePrototype.html#movement_modifier)
---@field movement_modifier float
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaParticlePrototype.html#movement_modifier_when_on_ground)
---@field movement_modifier_when_on_ground float
---The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaParticlePrototype.html#object_name)
---@field object_name string
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaParticlePrototype.html#regular_trigger_effect)
---@field regular_trigger_effect TriggerEffectItem
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaParticlePrototype.html#regular_trigger_effect_frequency)
---@field regular_trigger_effect_frequency uint
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaParticlePrototype.html#render_layer)
---@field render_layer RenderLayer
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaParticlePrototype.html#render_layer_when_on_ground)
---@field render_layer_when_on_ground RenderLayer
---Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaParticlePrototype.html#valid)
---@field valid boolean
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaParticlePrototype.html#vertical_acceleration)
---@field vertical_acceleration float
local LuaParticlePrototype={
}
end

