---@meta _

--$Factorio 2.0.9
--$Generator 1.1.47
--$Section runtime-api/LuaItemStack
-- This file is automatically generated. Edits will be overwritten without warning.

do
---A reference to an item and count owned by some external entity.
---
---In most instances this is a simple reference as in: it points at a specific slot in an inventory and not the item in the slot.
---
---In the instance this references an item on a [LuaTransportLine](https://lua-api.factorio.com/latest/classes/LuaTransportLine.html) the reference is only guaranteed to stay valid (and refer to the same item) as long as nothing changes the transport line.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html)
---@class LuaItemStack:LuaItemCommon
---Number of items in this stack.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#count)
---@field count uint
---How much health the item has, as a number in range `[0, 1]`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#health)
---@field health float
---If this is a module
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#is_module)
---@field is_module boolean
---If the item has additional data, returns LuaItem pointing at the extra data, otherwise returns nil.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#item)
---@field item? LuaItem
---Prototype name of the item held in this stack.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#name)
---@field name string
---The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#object_name)
---@field object_name string
---Prototype of the item held in this stack.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#prototype)
---@field prototype LuaItemPrototype
---The quality of this item.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#quality)
---@field quality LuaQualityPrototype
---The percent spoiled this item is if it spoils. `0` in the case of the item not spoiling.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#spoil_percent)
---@field spoil_percent double
---The tick this item spoils, or `0` if it does not spoil. When writing, setting to anything < the current game tick will spoil the item instantly.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#spoil_tick)
---@field spoil_tick uint
---Type of the item prototype.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#type)
---@field type string
---Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#valid)
---@field valid boolean
---Is this valid for reading? Differs from the usual `valid` in that `valid` will be `true` even if the item stack is blank but the entity that holds it is still valid.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#valid_for_read)
---@field valid_for_read boolean
local LuaItemStack={
---Add ammo to this ammo item.
---
---*Can only be used if this is AmmoItem*
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#add_ammo)
---@param amount float Amount of ammo to add.
add_ammo = function(amount) end;
---Add durability to this tool item.
---
---*Can only be used if this is ToolItem*
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#add_durability)
---@param amount double Amount of durability to add.
add_durability = function(amount) end;
---Would a call to [LuaItemStack::set\_stack](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#set_stack) succeed?
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#can_set_stack)
---@param stack? ItemStackIdentification Stack that would be set, possibly `nil`.
---@return boolean 
can_set_stack = function(stack) end;
---Clear this item stack.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#clear)
clear = function() end;
---Creates the equipment grid for this item if it doesn't exist and this is an item-with-entity-data that supports equipment grids.
---
---*Can only be used if this is ItemWithEntityData*
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#create_grid)
---@return LuaEquipmentGrid 
create_grid = function() end;
---Remove ammo from this ammo item.
---
---*Can only be used if this is AmmoItem*
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#drain_ammo)
---@param amount float Amount of ammo to remove.
drain_ammo = function(amount) end;
---Remove durability from this tool item.
---
---*Can only be used if this is ToolItem*
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#drain_durability)
---@param amount double Amount of durability to remove.
drain_durability = function(amount) end;
---Export a supported item (blueprint, blueprint-book, deconstruction-planner, upgrade-planner, item-with-tags) to a string.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#export_stack)
---@return string  #The exported string
export_stack = function() end;
---Import a supported item (blueprint, blueprint-book, deconstruction-planner, upgrade-planner, item-with-tags) from a string.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#import_stack)
---@param data string The string to import
---@return int  #0 if the import succeeded with no errors. -1 if the import succeeded with errors. 1 if the import failed.
import_stack = function(data) end;
---Set this item stack to another item stack.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#set_stack)
---@param stack? ItemStackIdentification Item stack to set it to. Omitting this parameter or passing `nil` will clear this item stack, as if [LuaItemStack::clear](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#clear) was called.
---@return boolean  #Whether the stack was set successfully. Returns `false` if this stack was not [valid for write](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#can_set_stack).
set_stack = function(stack) end;
---Spoils this item if the item can spoil.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#spoil)
spoil = function() end;
---Swaps this item stack with the given item stack if allowed.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#swap_stack)
---@param stack LuaItemStack 
---@return boolean  #Whether the 2 stacks were swapped successfully.
swap_stack = function(stack) end;
---Transfers the given item stack into this item stack.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#transfer_stack)
---@param stack ItemStackIdentification 
---@return boolean  #`true` if the full stack was transferred.
transfer_stack = function(stack) end;
---Use the capsule item with the entity as the source, targeting the given position.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaItemStack.html#use_capsule)
---@param entity LuaEntity The entity to use the capsule item with.
---@param target_position MapPosition The position to use the capsule item with.
---@return (LuaEntity)[]  #Array of the entities that were created by the capsule action.
use_capsule = function(entity, target_position) end;
}
end
