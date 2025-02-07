---@meta _

--$Factorio 2.0.9
--$Generator 1.1.47
--$Section runtime-api/LuaFontPrototype
-- This file is automatically generated. Edits will be overwritten without warning.

do
---Prototype of a font.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFontPrototype.html)
---@class LuaFontPrototype:LuaObject
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFontPrototype.html#border)
---@field border boolean
---The border color, if any.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFontPrototype.html#border_color)
---@field border_color? Color
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFontPrototype.html#filtered)
---@field filtered boolean
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFontPrototype.html#from)
---@field from string
---Name of this prototype.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFontPrototype.html#name)
---@field name string
---The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFontPrototype.html#object_name)
---@field object_name string
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFontPrototype.html#size)
---@field size int
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFontPrototype.html#spacing)
---@field spacing float
---Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaFontPrototype.html#valid)
---@field valid boolean
local LuaFontPrototype={
}
end

