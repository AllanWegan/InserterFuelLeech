---@meta _

--$Factorio 2.0.9
--$Generator 1.1.47
--$Section runtime-api/LuaInventory
-- This file is automatically generated. Edits will be overwritten without warning.

do
---A storage of item stacks.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html)
---@class LuaInventory:LuaObject
---The entity that owns this inventory, if any.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#entity_owner)
---@field entity_owner? LuaEntity
---The equipment that owns this inventory, if any.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#equipment_owner)
---@field equipment_owner? LuaEquipment
---The inventory index this inventory uses, if any.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#index)
---@field index? defines.inventory
---The mod that owns this inventory, if any.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#mod_owner)
---@field mod_owner? string
---The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#object_name)
---@field object_name string
---The player that owns this inventory, if any.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#player_owner)
---@field player_owner? LuaPlayer
---Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#valid)
---@field valid boolean
---The indexing operator.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#index_operator)
---
---### Example
---
---```
----- Will get the first item in the player's inventory.
---game.player.get_main_inventory()[1]
---```
---@field [uint] LuaItemStack
---Get the number of slots in this inventory.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#length_operator)
---
---### Example
---
---```
----- Will print the number of slots in the player's main inventory.
---game.player.print(#game.player.get_main_inventory())
---```
---@operator len:uint
local LuaInventory={
---Can at least some items be inserted?
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#can_insert)
---@param items ItemStackIdentification Items that would be inserted.
---@return boolean  #`true` if at least a part of the given items could be inserted into this inventory.
can_insert = function(items) end;
---If the given inventory slot filter can be set to the given filter.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#can_set_filter)
---@param index uint The item stack index
---@param filter ItemFilter The item filter
---@return boolean 
can_set_filter = function(index, filter) end;
---Make this inventory empty.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#clear)
clear = function() end;
---Counts the number of empty stacks.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#count_empty_stacks)
---@param include_filtered? boolean If true, filtered slots will be included. Defaults to false.
---@param include_bar? boolean If true, slots blocked by the current bar will be included. Defaults to true.
---@return uint 
count_empty_stacks = function(include_filtered, include_bar) end;
---Destroys this inventory.
---
---Only inventories created by [LuaGameScript::create\_inventory](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#create_inventory) can be destroyed this way.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#destroy)
destroy = function() end;
---Finds the first empty stack. Filtered slots are excluded unless a filter item is given.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#find_empty_stack)
---@param item? ItemWithQualityID If given, empty stacks that are filtered for this item will be included.
---@return LuaItemStack?  #The first empty stack, or `nil` if there aren't any empty stacks.
---@return uint?  #The stack index of the matching stack, if any is found.
find_empty_stack = function(item) end;
---Finds the first LuaItemStack in the inventory that matches the given item name.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#find_item_stack)
---@param item ItemWithQualityID The item to find
---@return LuaItemStack?  #The first matching stack, or `nil` if none match.
---@return uint?  #The stack index of the matching stack, if any is found.
find_item_stack = function(item) end;
---Get the current bar. This is the index at which the red area starts.
---
---Only useable if this inventory supports having a bar.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#get_bar)
---@return uint 
get_bar = function() end;
---Get counts of all items in this inventory.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#get_contents)
---@return (ItemCountWithQuality)[]  #List of all items in the inventory.
get_contents = function() end;
---Gets the filter for the given item stack index.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#get_filter)
---@param index uint The item stack index
---@return ItemFilter?  #The current filter or `nil` if none.
get_filter = function(index) end;
---Gets the number of the given item that can be inserted into this inventory.
---
---This is a "best guess" number; things like assembling machine filtered slots, module slots, items with durability, and items with mixed health will cause the result to be inaccurate. The main use for this is in checking how many of a basic item can fit into a basic inventory.
---
---This accounts for the 'bar' on the inventory.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#get_insertable_count)
---@param item ItemWithQualityID The item to check.
---@return uint 
get_insertable_count = function(item) end;
---Get the number of all or some items in this inventory.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#get_item_count)
---@param item? ItemWithQualityID The item to count. If not specified, count all items.
---@return uint 
get_item_count = function(item) end;
---Insert items into this inventory.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#insert)
---@param items ItemStackIdentification Items to insert.
---@return uint  #Number of items actually inserted.
insert = function(items) end;
---Does this inventory contain nothing?
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#is_empty)
---@return boolean 
is_empty = function() end;
---If this inventory supports filters and has at least 1 filter set.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#is_filtered)
---@return boolean 
is_filtered = function() end;
---Is every stack in this inventory full? Ignores stacks blocked by the current bar.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#is_full)
---@return boolean 
is_full = function() end;
---Remove items from this inventory.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#remove)
---@param items ItemStackIdentification Items to remove.
---@return uint  #Number of items actually removed.
remove = function(items) end;
---Resizes the inventory.
---
---Items in slots beyond the new capacity are deleted.
---
---Only inventories created by [LuaGameScript::create\_inventory](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#create_inventory) can be resized.
---
---**Events:**
---
---* Will raise [on\_pre\_script\_inventory\_resized](https://lua-api.factorio.com/latest/events.html#on_pre_script_inventory_resized) instantly.
---
---* Will raise [on\_script\_inventory\_resized](https://lua-api.factorio.com/latest/events.html#on_script_inventory_resized) instantly.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#resize)
---@param size uint16 New size of a inventory
resize = function(size) end;
---Set the current bar.
---
---Only useable if this inventory supports having a bar.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#set_bar)
---@param bar? uint The new limit. Omitting this parameter will clear the limit.
set_bar = function(bar) end;
---Sets the filter for the given item stack index.
---
---Some inventory slots don't allow some filters (gun ammo can't be filtered for non-ammo).
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#set_filter)
---@param index uint The item stack index.
---@param filter (ItemFilter)|(nil) The new filter. `nil` erases any existing filter.
---@return boolean  #If the filter was allowed to be set.
set_filter = function(index, filter) end;
---Sorts and merges the items in this inventory.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#sort_and_merge)
sort_and_merge = function() end;
---Does this inventory support a bar? Bar is the draggable red thing, found for example on chests, that limits the portion of the inventory that may be manipulated by machines.
---
---"Supporting a bar" doesn't mean that the bar is set to some nontrivial value. Supporting a bar means the inventory supports having this limit at all. The character's inventory is an example of an inventory without a bar; the wooden chest's inventory is an example of one with a bar.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#supports_bar)
---@return boolean 
supports_bar = function() end;
---If this inventory supports filters.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaInventory.html#supports_filters)
---@return boolean 
supports_filters = function() end;
}
end
