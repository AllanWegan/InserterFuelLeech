---@meta _

--$Factorio 2.0.9
--$Generator 1.1.47
--$Section runtime-api/LuaSettings
-- This file is automatically generated. Edits will be overwritten without warning.

do
---Object containing mod settings of three distinct types: `startup`, `global`, and `player`. An instance of LuaSettings is available through the global object named `settings`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaSettings.html)
---@class LuaSettings:LuaObject
---The current global mod settings, indexed by prototype name.
---
---Even though this attribute is marked as read-only, individual settings can be changed by overwriting their [ModSetting](https://lua-api.factorio.com/latest/concepts.html#ModSetting) table. Mods can only change their own settings. Using the in-game console, all player settings can be changed.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaSettings.html#global)
---@field global LuaCustomTable<string, ModSetting>
---The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaSettings.html#object_name)
---@field object_name string
---The **default** player mod settings for this map, indexed by prototype name. Changing these settings only affects the default settings for future players joining the game.
---
---Individual settings can be changed by overwriting their [ModSetting](https://lua-api.factorio.com/latest/concepts.html#ModSetting) table. Mods can only change their own settings. Using the in-game console, all player settings can be changed.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaSettings.html#player_default)
---@field player_default LuaCustomTable<string, ModSetting>
---The startup mod settings, indexed by prototype name.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaSettings.html#startup)
---@field startup LuaCustomTable<string, ModSetting>
settings={
---Gets the current per-player settings for the given player, indexed by prototype name. Returns the same structure as [LuaPlayer::mod\_settings](https://lua-api.factorio.com/latest/classes/LuaPlayer.html#mod_settings). This table becomes invalid if its associated player does.
---
---Even though this attribute is a getter, individual settings can be changed by overwriting their [ModSetting](https://lua-api.factorio.com/latest/concepts.html#ModSetting) table. Mods can only change their own settings. Using the in-game console, all player settings can be changed.
---
---### Example
---
---```
----- Change the value of the "active_lifestyle" setting
---settings.get_player_settings(player_index)["active_lifestyle"] = {value = true}
---```
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaSettings.html#get_player_settings)
---@param player PlayerIdentification 
---@return LuaCustomTable<string, ModSetting> 
get_player_settings = function(player) end;
}
end
