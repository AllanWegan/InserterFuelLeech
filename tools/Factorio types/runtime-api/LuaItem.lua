---@meta _

--$Factorio 2.0.9
--$Generator 1.1.47
--$Section runtime-api/LuaItem
-- This file is automatically generated. Edits will be overwritten without warning.

do
---A reference to an item with data. In contrast to LuaItemStack, this is binding to a specific item data even if it would move between entities or inventories.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItem.html)
---@class LuaItem:LuaItemCommon
---Object representing the item stack this item is located in right now. If its not possible to locate the item stack holding this item, a nil will be returned
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItem.html#item_stack)
---@field item_stack? LuaItemStack
---Name of the item prototype
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItem.html#name)
---@field name string
---The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItem.html#object_name)
---@field object_name string
---Item prototype of this item
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItem.html#prototype)
---@field prototype LuaItemPrototype
---The quality of this item.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItem.html#quality)
---@field quality LuaQualityPrototype
---Type of the item prototype
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItem.html#type)
---@field type string
---Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItem.html#valid)
---@field valid boolean
local LuaItem={
}
end
