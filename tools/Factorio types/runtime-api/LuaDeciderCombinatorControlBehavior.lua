---@meta _

--$Factorio 2.0.9
--$Generator 1.1.47
--$Section runtime-api/LuaDeciderCombinatorControlBehavior
-- This file is automatically generated. Edits will be overwritten without warning.

do
---Control behavior for decider combinators.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaDeciderCombinatorControlBehavior.html)
---@class LuaDeciderCombinatorControlBehavior:LuaCombinatorControlBehavior
---The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaDeciderCombinatorControlBehavior.html#object_name)
---@field object_name string
---This decider combinator's parameters. Writing `nil` clears the combinator's parameters.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaDeciderCombinatorControlBehavior.html#parameters)
---@field parameters DeciderCombinatorParameters
---Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaDeciderCombinatorControlBehavior.html#valid)
---@field valid boolean
local LuaDeciderCombinatorControlBehavior={
---Adds a new condition.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaDeciderCombinatorControlBehavior.html#add_condition)
---@param condition DeciderCombinatorCondition New condition to insert.
---@param index? uint Index to insert new condition at. If not specified, appends to the end.
add_condition = function(condition, index) end;
---Adds a new output.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaDeciderCombinatorControlBehavior.html#add_output)
---@param output DeciderCombinatorOutput New output to insert.
---@param index? uint Index to insert new output at. If not specified, appends to the end.
add_output = function(output, index) end;
---Gets the condition at `index`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaDeciderCombinatorControlBehavior.html#get_condition)
---@param index uint Index of condition to get.
---@return DeciderCombinatorCondition 
get_condition = function(index) end;
---Gets the output at `index`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaDeciderCombinatorControlBehavior.html#get_output)
---@param index uint Index of output to get.
---@return DeciderCombinatorOutput 
get_output = function(index) end;
---Removes the condition at `index`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaDeciderCombinatorControlBehavior.html#remove_condition)
---@param index uint Index of condition to remove.
remove_condition = function(index) end;
---Removes the output at `index`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaDeciderCombinatorControlBehavior.html#remove_output)
---@param index uint Index of output to remove.
remove_output = function(index) end;
---Sets the condition at `index`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaDeciderCombinatorControlBehavior.html#set_condition)
---@param index uint Index of condition to modify.
---@param condition DeciderCombinatorCondition Data to set selected condition to.
set_condition = function(index, condition) end;
---Sets the output at `index`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaDeciderCombinatorControlBehavior.html#set_output)
---@param index uint Index of output to modify.
---@param output DeciderCombinatorOutput Data to set selected output to.
set_output = function(index, output) end;
}
end
