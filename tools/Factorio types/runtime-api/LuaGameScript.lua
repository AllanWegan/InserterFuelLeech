---@meta _

--$Factorio 2.0.9
--$Generator 1.1.47
--$Section runtime-api/LuaGameScript
-- This file is automatically generated. Edits will be overwritten without warning.

do
---@class LuaGameScript.get_vehicles_param
---@field unit_number? uint
---@field force? ForceID
---)
---@field surface? SurfaceIdentification
---@field type? (EntityID)|((EntityID)[])
---@field is_moving? boolean
---@field has_passenger? boolean
local LuaGameScript_get_vehicles_param={
}
end

do
---@class LuaGameScript.play_sound_param
---The sound to play.
---@field path SoundPath
---Where the sound should be played. If not given, it's played at the current position of each player.
---@field position? MapPosition
---The volume of the sound to play. Must be between 0 and 1 inclusive.
---@field volume_modifier? double
---The volume mixer to play the sound through. Defaults to the default mixer for the given sound type.
---@field override_sound_type? SoundType
local LuaGameScript_play_sound_param={
}
end

do
---@class LuaGameScript.set_game_state_param
---@field game_finished? boolean
---@field player_won? boolean
---@field next_level? string
---@field can_continue? boolean
local LuaGameScript_set_game_state_param={
}
end

do
---@class LuaGameScript.set_lose_ending_info_param
---@field title LocalisedString
---@field message? LocalisedString
---@field bullet_points? (LocalisedString)[]
---@field final_message? LocalisedString
---@field image_path? string
local LuaGameScript_set_lose_ending_info_param={
}
end

do
---@class LuaGameScript.set_win_ending_info_param
---@field title LocalisedString
---@field message? LocalisedString
---@field bullet_points? (LocalisedString)[]
---@field final_message? LocalisedString
---@field image_path? string
local LuaGameScript_set_win_ending_info_param={
}
end

do
---@class LuaGameScript.show_message_dialog_param
---What the dialog should say
---@field text LocalisedString
---Path to an image to show on the dialog
---@field image? string
---If specified, dialog will show an arrow pointing to this place. When not specified, the arrow will point to the player's position. (Use `point_to={type="nowhere"}` to remove the arrow entirely.) The dialog itself will be placed near the arrow's target.
---@field point_to? GuiArrowSpecification
---The gui style to use for this speech bubble. Must be of type speech\_bubble.
---@field style? string
---Must be of type flow\_style.
---@field wrapper_frame_style? string
local LuaGameScript_show_message_dialog_param={
}
end

do
---@class LuaGameScript.take_screenshot_param
---The player to focus on. Defaults to the local player.
---@field player? PlayerIdentification
---If defined, the screenshot will only be taken for this player.
---@field by_player? PlayerIdentification
---If defined, the screenshot will be taken on this surface.
---@field surface? SurfaceIdentification
---If defined, the screenshot will be centered on this position. Otherwise, the screenshot will center on `player`.
---@field position? MapPosition
---The maximum allowed resolution is 16384x16384 (8192x8192 when `anti_alias` is `true`), but the maximum recommended resolution is 4096x4096 (resp. 2048x2048). The `x` value of the position is used as the width, the `y` value as the height.
---@field resolution? TilePosition
---The map zoom to take the screenshot at. Defaults to `1`.
---@field zoom? double
---The name of the image file. It should include a file extension indicating the desired format. Supports `.png`, `.jpg` /`.jpeg`, `.tga` and `.bmp`. Providing a directory path (ex. `"save/here/screenshot.png"`) will create the necessary folder structure in `script-output`. Defaults to `"screenshot.png"`.
---@field path? string
---Whether to include GUIs in the screenshot or not. Defaults to `false`.
---@field show_gui? boolean
---Whether to include entity info ("Alt mode") or not. Defaults to `false`.
---@field show_entity_info? boolean
---When `true` and when `player` is specified, the building preview for the item in the player's cursor will also be rendered. Defaults to `false`.
---@field show_cursor_building_preview? boolean
---Whether to render in double resolution and downscale the result (including GUI). Defaults to `false`.
---@field anti_alias? boolean
---The `.jpg` render quality as a percentage (from 0% to 100% inclusive), if used. A lower value means a more compressed image. Defaults to `80`.
---@field quality? int
---Whether to save the screenshot even during replay playback. Defaults to `false`.
---@field allow_in_replay? boolean
---Overrides the current surface daytime for the duration of screenshot rendering.
---@field daytime? double
---Overrides the tick of water animation, if animated water is enabled.
---@field water_tick? uint
---Screenshot requests are processed in between game update and render. The game may skip rendering (ie. drop frames) if the previous frame has not finished rendering or the game simulation starts to fall below 60 updates per second. If `force_render` is set to `true`, the game won't drop frames and process the screenshot request at the end of the update in which the request was created. This is not honored on multiplayer clients that are catching up to server. Defaults to `false`.
---@field force_render? boolean
local LuaGameScript_take_screenshot_param={
}
end

do
---@class LuaGameScript.take_technology_screenshot_param
---The name of the image file. It should include a file extension indicating the desired format. Supports `.png`, `.jpg` /`.jpeg`, `.tga` and `.bmp`. Providing a directory path (ex. `"save/here/screenshot.png"`) will create the necessary folder structure in `script-output`. Defaults to `"technology-screenshot.png"`.
---@field path? string
---The screenshot will be taken for this player.
---@field player PlayerIdentification
---The technology to highlight.
---@field selected_technology? TechnologyID
---If `true`, disabled technologies will be skipped. Their successors will be attached to the disabled technology's parents. Defaults to `false`.
---@field skip_disabled? boolean
---The `.jpg` render quality as a percentage (from 0% to 100% inclusive), if used. A lower value means a more compressed image. Defaults to `80`.
---@field quality? int
local LuaGameScript_take_technology_screenshot_param={
}
end

do
---Main toplevel type, provides access to most of the API though its members. An instance of LuaGameScript is available as the global object named `game`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html)
---@class LuaGameScript:LuaObject
---True by default. Can be used to disable autosaving. Make sure to turn it back on soon after.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#autosave_enabled)
---@field autosave_enabled boolean
---Array of the names of all the backers that supported the game development early on. These are used as names for labs, locomotives, radars, roboports, and train stops.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#backer_names)
---@field backer_names LuaCustomTable<uint, string>
---Records contained in the "game blueprints" tab of the blueprint library.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#blueprints)
---@field blueprints (LuaRecord)[]
---The players that are currently online.
---
---This does *not* index using player index. See [LuaPlayer::index](https://lua-api.factorio.com/latest/classes/LuaPlayer.html#index) on each player instance for the player index. This is primarily useful when you want to do some action against all online players.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#connected_players)
---@field connected_players (LuaPlayer)[]
---Whether a console command has been used.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#console_command_used)
---@field console_command_used boolean
---The default map gen settings for this save.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#default_map_gen_settings)
---@field default_map_gen_settings MapGenSettings
---Current scenario difficulty.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#difficulty)
---@field difficulty defines.difficulty
---The currently active set of difficulty settings. Even though this property is marked as read-only, the members of the dictionary that is returned can be modified mid-game. This is however not recommended as different difficulties can have differing technology and recipe trees, which can cause problems for players.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#difficulty_settings)
---
---### Example
---
---```
----- This will set the technology price multiplier to 12.
---game.difficulty_settings.technology_price_multiplier = 12
---```
---@field difficulty_settings DifficultySettings
---True by default. Can be used to disable the highlighting of resource patches when they are hovered on the map.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#draw_resource_selection)
---@field draw_resource_selection boolean
---Determines if enemy land mines are completely invisible or not.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#enemy_has_vision_on_land_mines)
---@field enemy_has_vision_on_land_mines boolean
---True while the victory screen is shown.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#finished)
---@field finished boolean
---True after players finished the game and clicked "continue".
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#finished_but_continuing)
---@field finished_but_continuing boolean
---Get a table of all the forces that currently exist. This sparse table allows you to find forces by indexing it with either their `name` or `index`. Iterating this table with `pairs()` will provide the `name`s as the keys. Iterating with `ipairs()` will not work at all.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#forces)
---@field forces LuaCustomTable<(uint)|(string), LuaForce>
---The currently active set of map settings. Even though this property is marked as read-only, the members of the dictionary that is returned can be modified mid-game.
---
---This does not contain difficulty settings, use [LuaGameScript::difficulty\_settings](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#difficulty_settings) instead.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#map_settings)
---@field map_settings MapSettings
---The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#object_name)
---@field object_name string
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#permissions)
---@field permissions LuaPermissionGroups
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#planets)
---@field planets LuaCustomTable<string, LuaPlanet>
---This property is only populated inside [custom command](https://lua-api.factorio.com/latest/classes/LuaCommandProcessor.html) handlers and when writing [Lua console commands](https://wiki.factorio.com/Console#Scripting_and_cheat_commands). Returns the player that is typing the command, `nil` in all other instances.
---
---See [LuaGameScript::players](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#players) for accessing all players.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#player)
---@field player? LuaPlayer
---Get a table of all the players that currently exist. This sparse table allows you to find players by indexing it with either their `name` or `index`. Iterating this table with `pairs()` will provide the `index`es as the keys. Iterating with `ipairs()` will not work at all.
---
---If only a single player is required, [LuaGameScript::get\_player](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#get_player) should be used instead, as it avoids the unnecessary overhead of passing the whole table to Lua.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#players)
---@field players LuaCustomTable<(uint)|(string), LuaPlayer>
---Simulation-related functions, or `nil` if the current game is not a simulation.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#simulation)
---@field simulation LuaSimulation
---Speed to update the map at. 1.0 is normal speed -- 60 UPS. Minimum value is 0.01.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#speed)
---@field speed float
---Get a table of all the surfaces that currently exist. This sparse table allows you to find surfaces by indexing it with either their `name` or `index`. Iterating this table with `pairs()` will provide the `name`s as the keys. Iterating with `ipairs()` will not work at all.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#surfaces)
---@field surfaces LuaCustomTable<(uint)|(string), LuaSurface>
---True by default. Can be used to prevent the game engine from printing certain messages.
---
---Prevented messages:
---
---* "player-started-research"
---* "player-queued-research"
---* "player-cancelled-research"
---* "technology-researched"
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#technology_notifications_enabled)
---@field technology_notifications_enabled boolean
---Current map tick.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#tick)
---@field tick uint
---If the tick has been paused. This means that entity update has been paused.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#tick_paused)
---@field tick_paused boolean
---The number of ticks since this game was created using either "new game" or "new game from scenario". Notably, this number progresses even when the game is [tick\_paused](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#tick_paused).
---
---This differs from [LuaGameScript::tick](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#tick) in that creating a game from a scenario always starts with this value at `0`, even if the scenario has its own level data where the `tick` has progressed past `0`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#ticks_played)
---@field ticks_played uint
---The number of ticks to be run while the tick is paused.
---
---When [LuaGameScript::tick\_paused](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#tick_paused) is true, ticks\_to\_run behaves the following way: While this is > 0, the entity update is running normally and this value is decremented every tick. When this reaches 0, the game will pause again.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#ticks_to_run)
---@field ticks_to_run uint
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#train_manager)
---@field train_manager LuaTrainManager
game={
---Instruct the game to perform an auto-save.
---
---Only the server will save in multiplayer. In single player a standard auto-save is triggered.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#auto_save)
---@param name? string The autosave name if any. Saves will be named \_autosave-*name* when provided.
auto_save = function(name) end;
---Bans the given player from this multiplayer game. Does nothing if this is a single player game of if the player running this isn't an admin.
---
---**Events:**
---
---* Will raise [on\_console\_command](https://lua-api.factorio.com/latest/events.html#on_console_command) instantly.
---
---* Will raise [on\_player\_banned](https://lua-api.factorio.com/latest/events.html#on_player_banned) instantly.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#ban_player)
---@param player (PlayerIdentification)|(string) The player to ban.
---@param reason? string The reason given if any.
ban_player = function(player, reason) end;
---Run internal consistency checks. Allegedly prints any errors it finds.
---
---Exists mainly for debugging reasons.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#check_consistency)
check_consistency = function() end;
---Create a new force.
---
---The game currently supports a maximum of 64 forces, including the three built-in forces. This means that a maximum of 61 new forces may be created. Force names must be unique.
---
---**Events:**
---
---* Will raise [on\_force\_created](https://lua-api.factorio.com/latest/events.html#on_force_created) instantly.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#create_force)
---@param force string Name of the new force
---@return LuaForce  #The force that was just created
create_force = function(force) end;
---Creates an inventory that is not owned by any game object.
---
---It can be resized later with [LuaInventory::resize](https://lua-api.factorio.com/latest/classes/LuaInventory.html#resize).
---
---Make sure to destroy it when you are done with it using [LuaInventory::destroy](https://lua-api.factorio.com/latest/classes/LuaInventory.html#destroy).
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#create_inventory)
---@param size uint16 The number of slots the inventory initially has.
---@param gui_title? LocalisedString The title of the GUI that is shown when this inventory is opened.
---@return LuaInventory 
create_inventory = function(size, gui_title) end;
---Creates a [LuaProfiler](https://lua-api.factorio.com/latest/classes/LuaProfiler.html), which is used for measuring script performance.
---
---LuaProfiler cannot be serialized.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#create_profiler)
---@param stopped? boolean Create the timer stopped
---@return LuaProfiler 
create_profiler = function(stopped) end;
---Creates a deterministic standalone random generator with the given seed or if a seed is not provided the initial map seed is used.
---
---*Make sure* you actually want to use this over math.random(...) as this provides entirely different functionality over math.random(...).
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#create_random_generator)
---@param seed? uint 
---@return LuaRandomGenerator 
create_random_generator = function(seed) end;
---Create a new surface.
---
---The game currently supports a maximum of 4 294 967 295 surfaces, including the default surface. Surface names must be unique.
---
---**Events:**
---
---* Will raise [on\_surface\_created](https://lua-api.factorio.com/latest/events.html#on_surface_created) instantly.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#create_surface)
---@param name string Name of the new surface.
---@param settings? MapGenSettings Map generation settings.
---@return LuaSurface  #The surface that was just created.
create_surface = function(name, settings) end;
---Deletes the given surface and all entities on it if possible.
---
---**Events:**
---
---* Will raise [on\_pre\_surface\_deleted](https://lua-api.factorio.com/latest/events.html#on_pre_surface_deleted) in a future tick.
---
---* Will raise [on\_surface\_deleted](https://lua-api.factorio.com/latest/events.html#on_surface_deleted) in a future tick.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#delete_surface)
---@param surface SurfaceIdentification The surface to be deleted. Currently the primary surface (1, 'nauvis') cannot be deleted.
---@return boolean  #If the surface was queued to be deleted.
delete_surface = function(surface) end;
---Disables replay saving for the current save file. Once done there's no way to re-enable replay saving for the save file without loading an old save.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#disable_replay)
disable_replay = function() end;
---Enables tip triggers in custom scenarios, that unlock new tips and show notices about unlocked tips.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#enable_tip_triggers_in_custom_scenarios)
enable_tip_triggers_in_custom_scenarios = function() end;
---Force a CRC check. Tells all peers to calculate their current CRC, which are then compared to each other. If a mismatch is detected, the game desyncs and some peers are forced to reconnect.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#force_crc)
force_crc = function() end;
---Gets an entity by its [name tag](https://lua-api.factorio.com/latest/classes/LuaEntity.html#name_tag). Entity name tags can also be set in the entity "extra settings" GUI in the map editor.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#get_entity_by_tag)
---@param tag string 
---@return LuaEntity? 
get_entity_by_tag = function(tag) end;
---Returns entity with a specified unit number or nil if entity with such number was not found or prototype does not have [EntityPrototypeFlags::get-by-unit-number](https://lua-api.factorio.com/latest/types/EntityPrototypeFlags.html#get_by_unit_number) flag set.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#get_entity_by_unit_number)
---@param unit_number uint 
---@return LuaEntity? 
get_entity_by_unit_number = function(unit_number) end;
---Gets the map exchange string for the map generation settings that were used to create this map.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#get_map_exchange_string)
---@return string 
get_map_exchange_string = function() end;
---Gets the given player or returns `nil` if no player is found.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#get_player)
---@param player (uint)|(string) The player index or name.
---@return LuaPlayer? 
get_player = function(player) end;
---The pollution statistics for this the given surface.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#get_pollution_statistics)
---@param surface SurfaceIdentification 
---@return LuaFlowStatistics 
get_pollution_statistics = function(surface) end;
---Gets the inventories created through [LuaGameScript::create\_inventory](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#create_inventory).
---
---Inventories created through console commands will be owned by `"core"`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#get_script_inventories)
---@param mod? string The mod whose inventories to get. If not provided all inventories are returned.
---@return {[string]:(LuaInventory)[]}  #A mapping of mod name to array of inventories owned by that mod.
get_script_inventories = function(mod) end;
---Gets the given surface or returns `nil` if no surface is found.
---
---This is a shortcut for [LuaGameScript::surfaces](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#surfaces).
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#get_surface)
---@param surface (uint)|(string) The surface index or name.
---@return LuaSurface? 
get_surface = function(surface) end;
---Returns vehicles in game
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#get_vehicles)
---@param param LuaGameScript.get_vehicles_param 
---@return (LuaEntity)[] 
get_vehicles = function(param) end;
---Is this the demo version of Factorio?
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#is_demo)
---@return boolean 
is_demo = function() end;
---Whether the save is loaded as a multiplayer map.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#is_multiplayer)
---@return boolean 
is_multiplayer = function() end;
---Kicks the given player from this multiplayer game. Does nothing if this is a single player game or if the player running this isn't an admin.
---
---**Events:**
---
---* Will raise [on\_console\_command](https://lua-api.factorio.com/latest/events.html#on_console_command) instantly.
---
---* Will raise [on\_player\_kicked](https://lua-api.factorio.com/latest/events.html#on_player_kicked) instantly.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#kick_player)
---@param player PlayerIdentification The player to kick.
---@param reason? string The reason given if any.
kick_player = function(player, reason) end;
---Marks two forces to be merged together. All players and entities in the source force will be reassigned to the target force. The source force will then be destroyed. Importantly, this does not merge technologies or bonuses, which are instead retained from the target force.
---
---The three built-in forces (player, enemy and neutral) can't be destroyed, meaning they can't be used as the source argument to this function.
---
---The source force is not removed until the end of the current tick, or if called during the [on\_forces\_merging](https://lua-api.factorio.com/latest/events.html#on_forces_merging) or [on\_forces\_merged](https://lua-api.factorio.com/latest/events.html#on_forces_merged) event, the end of the next tick.
---
---**Events:**
---
---* Will raise [on\_forces\_merged](https://lua-api.factorio.com/latest/events.html#on_forces_merged) in a future tick.
---
---* Will raise [on\_forces\_merging](https://lua-api.factorio.com/latest/events.html#on_forces_merging) in a future tick.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#merge_forces)
---@param source ForceID The force to remove.
---@param destination ForceID The force to reassign all entities to.
merge_forces = function(source, destination) end;
---Mutes the given player. Does nothing if the player running this isn't an admin.
---
---**Events:**
---
---* Will raise [on\_console\_command](https://lua-api.factorio.com/latest/events.html#on_console_command) instantly.
---
---* Will raise [on\_player\_muted](https://lua-api.factorio.com/latest/events.html#on_player_muted) instantly.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#mute_player)
---@param player PlayerIdentification The player to mute.
mute_player = function(player) end;
---Play a sound for every player in the game.
---
---The sound is not played if its location is not [charted](https://lua-api.factorio.com/latest/classes/LuaForce.html#chart) for that player.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#play_sound)
---@param param LuaGameScript.play_sound_param 
play_sound = function(param) end;
---Print text to the chat console all players.
---
---By default, messages that are identical to a message sent in the last 60 ticks are not printed again.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#print)
---@param message LocalisedString 
---@param print_settings? PrintSettings 
print = function(message, print_settings) end;
---Purges the given players messages from the game. Does nothing if the player running this isn't an admin.
---
---**Events:**
---
---* Will raise [on\_console\_command](https://lua-api.factorio.com/latest/events.html#on_console_command) instantly.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#purge_player)
---@param player PlayerIdentification The player to purge.
purge_player = function(player) end;
---Regenerate autoplacement of some entities on all surfaces. This can be used to autoplace newly-added entities.
---
---All specified entity prototypes must be autoplacable.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#regenerate_entity)
---@param entities (string)|((string)[]) Prototype names of entity or entities to autoplace.
regenerate_entity = function(entities) end;
---Forces a reload of all mods.
---
---This will act like saving and loading from the mod(s) perspective.
---
---This will do nothing if run in multiplayer.
---
---This disables the replay if replay is enabled.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#reload_mods)
reload_mods = function() end;
---Forces a reload of the scenario script from the original scenario location.
---
---This disables the replay if replay is enabled.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#reload_script)
reload_script = function() end;
---Remove players who are currently not connected from the map.
---
---**Events:**
---
---* Will raise [on\_player\_removed](https://lua-api.factorio.com/latest/events.html#on_player_removed) instantly.
---
---* Will raise [on\_pre\_player\_removed](https://lua-api.factorio.com/latest/events.html#on_pre_player_removed) instantly.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#remove_offline_players)
---@param players? (PlayerIdentification)[] List of players to remove. If not specified, remove all offline players.
remove_offline_players = function(players) end;
---Reset scenario state (game\_finished, player\_won, etc.).
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#reset_game_state)
reset_game_state = function() end;
---Resets the amount of time played for this map.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#reset_time_played)
reset_time_played = function() end;
---Saves the current configuration of Atlas to a file. This will result in huge file containing all of the game graphics moved to as small space as possible.
---
---Exists mainly for debugging reasons.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#save_atlas)
save_atlas = function() end;
---Instruct the server to save the map. Only actually saves when in multiplayer.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#server_save)
---@param name? string Save file name. If not specified, the currently running save is overwritten. If there is no current save, no save is made.
server_save = function(name) end;
---Set scenario state. Any parameters not provided do not change the current state.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#set_game_state)
---@param param LuaGameScript.set_game_state_param 
set_game_state = function(param) end;
---Set losing ending information for the current scenario.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#set_lose_ending_info)
---@param param LuaGameScript.set_lose_ending_info_param 
set_lose_ending_info = function(param) end;
---Forces the screenshot saving system to wait until all queued screenshots have been written to disk.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#set_wait_for_screenshots_to_finish)
set_wait_for_screenshots_to_finish = function() end;
---Set winning ending information for the current scenario.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#set_win_ending_info)
---@param param LuaGameScript.set_win_ending_info_param 
set_win_ending_info = function(param) end;
---Show an in-game message dialog.
---
---Can only be used when the map contains exactly one player.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#show_message_dialog)
---@param param LuaGameScript.show_message_dialog_param 
show_message_dialog = function(param) end;
---Take a screenshot of the game and save it to the `script-output` folder, located in the game's [user data directory](https://wiki.factorio.com/User_data_directory). The name of the image file can be specified via the `path` parameter.
---
---If Factorio is running headless, this function will do nothing.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#take_screenshot)
---@param param LuaGameScript.take_screenshot_param 
take_screenshot = function(param) end;
---Take a screenshot of the technology screen and save it to the `script-output` folder, located in the game's [user data directory](https://wiki.factorio.com/User_data_directory). The name of the image file can be specified via the `path` parameter.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#take_technology_screenshot)
---@param param LuaGameScript.take_technology_screenshot_param 
take_technology_screenshot = function(param) end;
---Unbans the given player from this multiplayer game. Does nothing if this is a single player game of if the player running this isn't an admin.
---
---**Events:**
---
---* Will raise [on\_console\_command](https://lua-api.factorio.com/latest/events.html#on_console_command) instantly.
---
---* Will raise [on\_player\_unbanned](https://lua-api.factorio.com/latest/events.html#on_player_unbanned) instantly.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#unban_player)
---@param player (PlayerIdentification)|(string) The player to unban.
unban_player = function(player) end;
---Unmutes the given player. Does nothing if the player running this isn't an admin.
---
---**Events:**
---
---* Will raise [on\_console\_command](https://lua-api.factorio.com/latest/events.html#on_console_command) instantly.
---
---* Will raise [on\_player\_unmuted](https://lua-api.factorio.com/latest/events.html#on_player_unmuted) instantly.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#unmute_player)
---@param player PlayerIdentification The player to unmute.
unmute_player = function(player) end;
}
end

