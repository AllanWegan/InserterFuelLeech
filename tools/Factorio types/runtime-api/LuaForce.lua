---@meta _

--$Factorio 2.0.9
--$Generator 1.1.47
--$Section runtime-api/LuaForce
-- This file is automatically generated. Edits will be overwritten without warning.

do
---@class LuaForce.create_space_platform_param
---The platform name. If not provided, a random name will be used.
---@field name? string
---The planet that the platform will orbit.
---@field planet SpaceLocationID
---The starter pack required to build the platform.
---@field starter_pack ItemID
local LuaForce_create_space_platform_param={
}
end

do
---@class LuaForce.play_sound_param
---The sound to play.
---@field path SoundPath
---Where the sound should be played. If not given, it's played at the current position of each player.
---@field position? MapPosition
---The volume of the sound to play. Must be between 0 and 1 inclusive.
---@field volume_modifier? double
---The volume mixer to play the sound through. Defaults to the default mixer for the given sound type.
---@field override_sound_type? SoundType
local LuaForce_play_sound_param={
}
end

do
---`LuaForce` encapsulates data local to each "force" or "faction" of the game. Default forces are player, enemy and neutral. Players and mods can create additional forces (up to 64 total).
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html)
---@class LuaForce:LuaObject
---Enables some higher-level AI behaviour for this force. When set to `true`, biters belonging to this force will automatically expand into new territories, build new spawners, and form unit groups. By default, this value is `true` for the enemy force and `false` for all others.
---
---Setting this to `false` does not turn off biters' AI. They will still move around and attack players who come close.
---
---It is necessary for a force to be AI controllable in order to be able to create unit groups or build bases from scripts.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#ai_controllable)
---@field ai_controllable boolean
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#artillery_range_modifier)
---@field artillery_range_modifier double
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#beacon_distribution_modifier)
---@field beacon_distribution_modifier double
---Belt stack size bonus.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#belt_stack_size_bonus)
---@field belt_stack_size_bonus uint
---Number of items that can be transferred by bulk inserters. When writing to this value, it must be >= 0 and <= 254.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#bulk_inserter_capacity_bonus)
---@field bulk_inserter_capacity_bonus uint
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#character_build_distance_bonus)
---@field character_build_distance_bonus uint
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#character_health_bonus)
---@field character_health_bonus double
---The number of additional inventory slots the character main inventory has.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#character_inventory_slots_bonus)
---@field character_inventory_slots_bonus uint
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#character_item_drop_distance_bonus)
---@field character_item_drop_distance_bonus uint
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#character_item_pickup_distance_bonus)
---@field character_item_pickup_distance_bonus double
---`true` if character requester logistics is enabled.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#character_logistic_requests)
---@field character_logistic_requests boolean
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#character_loot_pickup_distance_bonus)
---@field character_loot_pickup_distance_bonus double
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#character_reach_distance_bonus)
---@field character_reach_distance_bonus uint
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#character_resource_reach_distance_bonus)
---@field character_resource_reach_distance_bonus double
---Modifies the running speed of all characters in this force by the given value as a percentage. Setting the running modifier to `0.5` makes the character run 50% faster. The minimum value of `-1` reduces the movement speed by 100%, resulting in a speed of `0`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#character_running_speed_modifier)
---@field character_running_speed_modifier double
---Number of character trash slots.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#character_trash_slot_count)
---@field character_trash_slot_count double
---Effective color of this force.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#color)
---@field color Color
---The connected players belonging to this force.
---
---This is primarily useful when you want to do some action against all online players of this force.
---
---This does *not* index using player index. See [LuaPlayer::index](https://lua-api.factorio.com/latest/classes/LuaPlayer.html#index) on each player instance for the player index.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#connected_players)
---@field connected_players (LuaPlayer)[]
---When an entity dies, a ghost will be placed for automatic reconstruction.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#create_ghost_on_entity_death)
---@field create_ghost_on_entity_death boolean
---The currently ongoing technology research, if any.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#current_research)
---@field current_research? LuaTechnology
---Custom color for this force. If specified, will take priority over other sources of the force color. Writing `nil` clears custom color. Will return `nil` if it was not specified or if was set to `{0,0,0,0}`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#custom_color)
---@field custom_color? Color
---The time, in ticks, before a deconstruction order is removed.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#deconstruction_time_to_live)
---@field deconstruction_time_to_live uint
---Additional lifetime for following robots.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#following_robots_lifetime_modifier)
---@field following_robots_lifetime_modifier double
---If friendly fire is enabled for this force.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#friendly_fire)
---@field friendly_fire boolean
---This force's index in [LuaGameScript::forces](https://lua-api.factorio.com/latest/classes/LuaGameScript.html#forces) (unique ID). It is assigned when a force is created, and remains so until it is [merged](https://lua-api.factorio.com/latest/events.html#on_forces_merged) (ie. deleted). Indexes of merged forces can be reused.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#index)
---@field index uint
---The inserter stack size bonus for non stack inserters
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#inserter_stack_size_bonus)
---@field inserter_stack_size_bonus double
---All of the items that have been launched in rockets.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#items_launched)
---@field items_launched (ItemCountWithQuality)[]
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#laboratory_productivity_bonus)
---@field laboratory_productivity_bonus double
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#laboratory_speed_modifier)
---@field laboratory_speed_modifier double
---List of logistic networks, grouped by surface.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#logistic_networks)
---@field logistic_networks {[string]:(LuaLogisticNetwork)[]}
---Multiplier of the manual crafting speed. Default value is `0`. The actual crafting speed will be multiplied by `1 + manual_crafting_speed_modifier`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#manual_crafting_speed_modifier)
---
---### Example
---
---```
----- Double the player's crafting speed
---game.player.force.manual_crafting_speed_modifier = 1
---```
---@field manual_crafting_speed_modifier double
---Multiplier of the manual mining speed. Default value is `0`. The actual mining speed will be multiplied by `1 + manual_mining_speed_modifier`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#manual_mining_speed_modifier)
---
---### Example
---
---```
----- Double the player's mining speed
---game.player.force.manual_mining_speed_modifier = 1
---```
---@field manual_mining_speed_modifier double
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#max_failed_attempts_per_tick_per_construction_queue)
---@field max_failed_attempts_per_tick_per_construction_queue uint
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#max_successful_attempts_per_tick_per_construction_queue)
---@field max_successful_attempts_per_tick_per_construction_queue uint
---Maximum number of follower robots.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#maximum_following_robot_count)
---@field maximum_following_robot_count uint
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#mining_drill_productivity_bonus)
---@field mining_drill_productivity_bonus double
---Name of the force.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#name)
---
---### Example
---
---```
---game.player.print(game.player.force.name) -- => "player"
---```
---@field name string
---The class name of this object. Available even when `valid` is false. For LuaStruct objects it may also be suffixed with a dotted path to a member of the struct.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#object_name)
---@field object_name string
---The space platforms that belong to this force mapped by their index value.
---
---This will include platforms that are pending deletion.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#platforms)
---@field platforms {[uint]:LuaSpacePlatform}
---Players belonging to this force.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#players)
---@field players (LuaPlayer)[]
---The previous research, if any.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#previous_research)
---@field previous_research? LuaTechnology
---Recipes available to this force, indexed by `name`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#recipes)
---
---### Example
---
---```
----- Prints the category of the given recipe
---game.player.print(game.player.force.recipes["transport-belt"].category)
---```
---@field recipes LuaCustomTable<string, LuaRecipe>
---Whether research is enabled for this force, see [LuaForce::enable\_research](https://lua-api.factorio.com/latest/classes/LuaForce.html#enable_research) and [LuaForce::disable\_research](https://lua-api.factorio.com/latest/classes/LuaForce.html#disable_research).
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#research_enabled)
---@field research_enabled boolean
---Progress of current research, as a number in range `[0, 1]`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#research_progress)
---@field research_progress double
---The research queue of this force. The first technology in the array is the currently active one. Reading this attribute gives an array of [LuaTechnology](https://lua-api.factorio.com/latest/classes/LuaTechnology.html).
---
---To write to this, the entire table must be written. Providing an empty table or `nil` will empty the research queue and cancel the current research.  Writing to this when the research queue is disabled will simply set the last research in the table as the current research.
---
---This only allows mods to queue research that this force is able to research in the first place. As an example, an already researched technology or one whose prerequisites are not fulfilled will not be queued, but dropped silently instead.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#research_queue)
---@field research_queue (TechnologyID)[]
---The number of rockets launched.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#rockets_launched)
---@field rockets_launched uint
---If sharing chart data is enabled for this force.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#share_chart)
---@field share_chart boolean
---Technologies owned by this force, indexed by `name`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#technologies)
---
---### Example
---
---```
----- Researches the technology for the player's force
---game.player.force.technologies["steel-processing"].researched = true
---```
---@field technologies LuaCustomTable<string, LuaTechnology>
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#train_braking_force_bonus)
---@field train_braking_force_bonus double
---Is this object valid? This Lua object holds a reference to an object within the game engine. It is possible that the game-engine object is removed whilst a mod still holds the corresponding Lua object. If that happens, the object becomes invalid, i.e. this attribute will be `false`. Mods are advised to check for object validity if any change to the game state might have occurred between the creation of the Lua object and its access.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#valid)
---@field valid boolean
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#worker_robots_battery_modifier)
---@field worker_robots_battery_modifier double
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#worker_robots_speed_modifier)
---@field worker_robots_speed_modifier double
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#worker_robots_storage_bonus)
---@field worker_robots_storage_bonus double
local LuaForce={
---Adds a custom chart tag to the given surface and returns the new tag or `nil` if the given position isn't valid for a chart tag.
---
---The chunk must be charted for a tag to be valid at that location.
---
---**Events:**
---
---* May raise [on\_chart\_tag\_added](https://lua-api.factorio.com/latest/events.html#on_chart_tag_added) instantly.
---  Raised if the chart tag was successfully added.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#add_chart_tag)
---@param surface SurfaceIdentification Which surface to add the tag to.
---@param tag ChartTagSpec The tag to add.
---@return LuaCustomChartTag? 
add_chart_tag = function(surface, tag) end;
---Add this technology to the back of the research queue if the queue is enabled. Otherwise, set this technology to be researched now.
---
---**Events:**
---
---* May raise [on\_research\_started](https://lua-api.factorio.com/latest/events.html#on_research_started) instantly.
---  Raised if the technology was successfully added.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#add_research)
---@param technology TechnologyID 
---@return boolean  #Whether the technology was successfully added.
add_research = function(technology) end;
---Cancels pending chart requests for the given surface or all surfaces.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#cancel_charting)
---@param surface? SurfaceIdentification 
cancel_charting = function(surface) end;
---Stop the research currently in progress. This will remove any dependent technologies from the research queue.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#cancel_current_research)
cancel_current_research = function() end;
---Chart a portion of the map. The chart for the given area is refreshed; it creates chart for any parts of the given area that haven't been charted yet.
---
---### Example
---
---```
----- Charts a 2048x2048 rectangle centered around the origin.
---game.player.force.chart(game.player.surface, {{x = -1024, y = -1024}, {x = 1024, y = 1024}})
---```
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#chart)
---@param surface SurfaceIdentification 
---@param area BoundingBox The area on the given surface to chart.
chart = function(surface, area) end;
---Chart all generated chunks.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#chart_all)
---@param surface? SurfaceIdentification Which surface to chart or all if not given.
chart_all = function(surface) end;
---Erases chart data for this force.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#clear_chart)
---@param surface? SurfaceIdentification Which surface to erase chart data for or if not provided all surfaces charts are erased.
clear_chart = function(surface) end;
---Copies the given surface's chart from the given force to this force.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#copy_chart)
---@param source_force ForceID The force to copy from
---@param source_surface SurfaceIdentification The surface to copy from.
---@param destination_surface SurfaceIdentification The surface to copy to.
copy_chart = function(source_force, source_surface, destination_surface) end;
---Copies all of the given changeable values (except charts) from the given force to this force.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#copy_from)
---@param force ForceID The force to copy from.
copy_from = function(force) end;
---Creates a new space platform on this force.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#create_space_platform)
---@param param? LuaForce.create_space_platform_param 
---@return LuaSpacePlatform? 
create_space_platform = function(param) end;
---Disable all recipes and technologies. Only recipes and technologies enabled explicitly will be useable from this point.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#disable_all_prototypes)
disable_all_prototypes = function() end;
---Disable research for this force.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#disable_research)
disable_research = function() end;
---Enables all recipes and technologies. The opposite of [LuaForce::disable\_all\_prototypes](https://lua-api.factorio.com/latest/classes/LuaForce.html#disable_all_prototypes).
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#enable_all_prototypes)
enable_all_prototypes = function() end;
---Unlock all recipes.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#enable_all_recipes)
enable_all_recipes = function() end;
---Unlock all technologies.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#enable_all_technologies)
enable_all_technologies = function() end;
---Enable research for this force.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#enable_research)
enable_research = function() end;
---Finds all custom chart tags within the given bounding box on the given surface.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#find_chart_tags)
---@param surface SurfaceIdentification 
---@param area? BoundingBox 
---@return (LuaCustomChartTag)[] 
find_chart_tags = function(surface, area) end;
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#find_logistic_network_by_position)
---@param position MapPosition Position to find a network for
---@param surface SurfaceIdentification Surface to search on
---@return LuaLogisticNetwork?  #The found network or `nil`.
find_logistic_network_by_position = function(position, surface) end;
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_ammo_damage_modifier)
---@param ammo string Ammo category
---@return double 
get_ammo_damage_modifier = function(ammo) end;
---Is `other` force in this force's cease fire list?
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_cease_fire)
---@param other ForceID 
---@return boolean 
get_cease_fire = function(other) end;
---The entity build statistics for this force (built and mined) for the given surface.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_entity_build_count_statistics)
---@param surface SurfaceIdentification 
---@return LuaFlowStatistics 
get_entity_build_count_statistics = function(surface) end;
---Count entities of given type.
---
---This function has O(1) time complexity as entity counts are kept and maintained in the game engine.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_entity_count)
---@param name EntityID Prototype name of the entity.
---@return uint  #Number of entities of given prototype belonging to this force.
get_entity_count = function(name) end;
---Fetches the evolution factor of this force on the given surface.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_evolution_factor)
---@param surface? SurfaceIdentification Defaults to "nauvis".
---@return double 
get_evolution_factor = function(surface) end;
---Fetches the spawner kill part of the evolution factor of this force on the given surface.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_evolution_factor_by_killing_spawners)
---@param surface? SurfaceIdentification Defaults to "nauvis".
---@return double 
get_evolution_factor_by_killing_spawners = function(surface) end;
---Fetches the pollution part of the evolution factor of this force on the given surface.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_evolution_factor_by_pollution)
---@param surface? SurfaceIdentification Defaults to "nauvis".
---@return double 
get_evolution_factor_by_pollution = function(surface) end;
---Fetches the time part of the evolution factor of this force on the given surface.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_evolution_factor_by_time)
---@param surface? SurfaceIdentification Defaults to "nauvis".
---@return double 
get_evolution_factor_by_time = function(surface) end;
---The fluid production statistics for this force for the given surface.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_fluid_production_statistics)
---@param surface SurfaceIdentification 
---@return LuaFlowStatistics 
get_fluid_production_statistics = function(surface) end;
---Is `other` force in this force's friends list.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_friend)
---@param other ForceID 
---@return boolean 
get_friend = function(other) end;
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_gun_speed_modifier)
---@param ammo string Ammo category
---@return double 
get_gun_speed_modifier = function(ammo) end;
---Gets if the given recipe is explicitly disabled from being hand crafted.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_hand_crafting_disabled_for_recipe)
---@param recipe RecipeID 
---@return boolean 
get_hand_crafting_disabled_for_recipe = function(recipe) end;
---Gets the count of a given item launched in rockets.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_item_launched)
---@param item ItemID The item to get
---@return uint  #The count of the item that has been launched.
get_item_launched = function(item) end;
---The item production statistics for this force for the given surface.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_item_production_statistics)
---@param surface SurfaceIdentification 
---@return LuaFlowStatistics 
get_item_production_statistics = function(surface) end;
---The kill counter statistics for this force for the given surface.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_kill_count_statistics)
---@param surface SurfaceIdentification 
---@return LuaFlowStatistics 
get_kill_count_statistics = function(surface) end;
---Gets the linked inventory for the given prototype and link ID if it exists or `nil`.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_linked_inventory)
---@param prototype EntityID 
---@param link_id uint 
---@return LuaInventory? 
get_linked_inventory = function(prototype, link_id) end;
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_spawn_position)
---@param surface SurfaceIdentification 
---@return MapPosition 
get_spawn_position = function(surface) end;
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_surface_hidden)
---@param surface SurfaceIdentification 
---@return boolean 
get_surface_hidden = function(surface) end;
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#get_turret_attack_modifier)
---@param turret EntityID Turret prototype name
---@return double 
get_turret_attack_modifier = function(turret) end;
---Has a chunk been charted?
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#is_chunk_charted)
---@param surface SurfaceIdentification 
---@param position ChunkPosition Position of the chunk.
---@return boolean 
is_chunk_charted = function(surface, position) end;
---Has a chunk been requested for charting?
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#is_chunk_requested_for_charting)
---@param surface SurfaceIdentification 
---@param position ChunkPosition Position of the chunk.
---@return boolean 
is_chunk_requested_for_charting = function(surface, position) end;
---Is the given chunk currently charted and visible (not covered by fog of war) on the map.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#is_chunk_visible)
---@param surface SurfaceIdentification 
---@param position ChunkPosition 
---@return boolean 
is_chunk_visible = function(surface, position) end;
---Is this force an enemy? This differs from `get_cease_fire` in that it is always false for neutral force. This is equivalent to checking the `enemy` ForceCondition.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#is_enemy)
---@param other ForceID 
---@return boolean 
is_enemy = function(other) end;
---Is this force a friend? This differs from `get_friend` in that it is always true for neutral force. This is equivalent to checking the `friend` ForceCondition.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#is_friend)
---@param other ForceID 
---@return boolean 
is_friend = function(other) end;
---Is pathfinder busy? When the pathfinder is busy, it won't accept any more pathfinding requests.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#is_pathfinder_busy)
---@return boolean 
is_pathfinder_busy = function() end;
---Is the specified quality unlocked for this force?
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#is_quality_unlocked)
---@param quality QualityID Name of the quality.
is_quality_unlocked = function(quality) end;
---Is the specified planet unlocked for this force?
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#is_space_location_unlocked)
---@param name SpaceLocationID Name of the planet.
is_space_location_unlocked = function(name) end;
---Are the space platforms unlocked? This basically just controls the availability of the space platforms button.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#is_space_platforms_unlocked)
---@return boolean 
is_space_platforms_unlocked = function() end;
---Kill all units and flush the pathfinder.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#kill_all_units)
kill_all_units = function() end;
---Locks the quality to not be accessible to this force.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#lock_quality)
---@param quality QualityID Name of the quality.
lock_quality = function(quality) end;
---Locks the planet to not be accessible to this force.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#lock_space_location)
---@param name SpaceLocationID Name of the planet.
lock_space_location = function(name) end;
---Locks the space platforms, which disables the space platforms button
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#lock_space_platforms)
lock_space_platforms = function() end;
---Play a sound for every player in this force.
---
---The sound is not played if its location is not [charted](https://lua-api.factorio.com/latest/classes/LuaForce.html#chart) for this force.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#play_sound)
---@param param LuaForce.play_sound_param 
play_sound = function(param) end;
---Print text to the chat console of all players on this force.
---
---By default, messages that are identical to a message sent in the last 60 ticks are not printed again.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#print)
---@param message LocalisedString 
---@param print_settings? PrintSettings 
print = function(message, print_settings) end;
---Force a rechart of the whole chart.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#rechart)
---@param surface? SurfaceIdentification Which surface to rechart or all if not given.
rechart = function(surface) end;
---Research all technologies.
---
---**Events:**
---
---* Will raise [on\_research\_finished](https://lua-api.factorio.com/latest/events.html#on_research_finished) instantly.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#research_all_technologies)
---@param include_disabled_prototypes? boolean Whether technologies that are explicitly disabled in the prototype should also be researched. Defaults to `false`.
research_all_technologies = function(include_disabled_prototypes) end;
---Reset everything. All technologies are set to not researched, all modifiers are set to default values.
---
---**Events:**
---
---* Will raise [on\_force\_reset](https://lua-api.factorio.com/latest/events.html#on_force_reset) instantly.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#reset)
reset = function() end;
---Resets evolution for this force to zero.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#reset_evolution)
reset_evolution = function() end;
---Load the original version of all recipes from the prototypes.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#reset_recipes)
reset_recipes = function() end;
---Load the original versions of technologies from prototypes. Preserves research state of technologies.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#reset_technologies)
reset_technologies = function() end;
---Reapplies all possible research effects, including unlocked recipes. Any custom changes are lost. Preserves research state of technologies.
---
---**Events:**
---
---* Will raise [on\_technology\_effects\_reset](https://lua-api.factorio.com/latest/events.html#on_technology_effects_reset) instantly.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#reset_technology_effects)
reset_technology_effects = function() end;
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#set_ammo_damage_modifier)
---@param ammo string Ammo category
---@param modifier double 
set_ammo_damage_modifier = function(ammo, modifier) end;
---Add `other` force to this force's cease fire list. Forces on the cease fire list won't be targeted for attack.
---
---**Events:**
---
---* Will raise [on\_force\_cease\_fire\_changed](https://lua-api.factorio.com/latest/events.html#on_force_cease_fire_changed) instantly.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#set_cease_fire)
---@param other ForceID 
---@param cease_fire boolean 
set_cease_fire = function(other, cease_fire) end;
---Sets the evolution factor of this force on the given surface.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#set_evolution_factor)
---@param factor double 
---@param surface? SurfaceIdentification Defaults to "nauvis".
set_evolution_factor = function(factor, surface) end;
---Sets the spawner kill part of the evolution factor of this force on the given surface.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#set_evolution_factor_by_killing_spawners)
---@param factor double 
---@param surface? SurfaceIdentification Defaults to "nauvis".
set_evolution_factor_by_killing_spawners = function(factor, surface) end;
---Sets the pollution part of the evolution factor of this force on the given surface.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#set_evolution_factor_by_pollution)
---@param factor double 
---@param surface? SurfaceIdentification Defaults to "nauvis".
set_evolution_factor_by_pollution = function(factor, surface) end;
---Sets the time part of the evolution factor of this force on the given surface.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#set_evolution_factor_by_time)
---@param factor double 
---@param surface? SurfaceIdentification Defaults to "nauvis".
set_evolution_factor_by_time = function(factor, surface) end;
---Add `other` force to this force's friends list. Friends have unrestricted access to buildings and turrets won't fire at them.
---
---**Events:**
---
---* Will raise [on\_force\_friends\_changed](https://lua-api.factorio.com/latest/events.html#on_force_friends_changed) instantly.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#set_friend)
---@param other ForceID 
---@param friend boolean 
set_friend = function(other, friend) end;
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#set_gun_speed_modifier)
---@param ammo string Ammo category
---@param modifier double 
set_gun_speed_modifier = function(ammo, modifier) end;
---Sets if the given recipe can be hand-crafted. This is used to explicitly disable hand crafting a recipe - it won't allow hand-crafting otherwise not hand-craftable recipes.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#set_hand_crafting_disabled_for_recipe)
---@param recipe RecipeID 
---@param hand_crafting_disabled boolean 
set_hand_crafting_disabled_for_recipe = function(recipe, hand_crafting_disabled) end;
---Sets the count of a given item launched in rockets.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#set_item_launched)
---@param item ItemID The item to set
---@param count uint The count to set
set_item_launched = function(item, count) end;
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#set_spawn_position)
---@param position MapPosition The new position on the given surface.
---@param surface SurfaceIdentification Surface to set the spawn position for.
set_spawn_position = function(position, surface) end;
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#set_surface_hidden)
---@param surface SurfaceIdentification Surface to set hidden for.
---@param hidden boolean Whether to hide the surface or not.
set_surface_hidden = function(surface, hidden) end;
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#set_turret_attack_modifier)
---@param turret EntityID Turret prototype name
---@param modifier double 
set_turret_attack_modifier = function(turret, modifier) end;
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#unchart_chunk)
---@param position ChunkPosition The chunk position to unchart.
---@param surface SurfaceIdentification Surface to unchart on.
unchart_chunk = function(position, surface) end;
---Unlocks the quality to be accessible to this force.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#unlock_quality)
---@param quality QualityID Name of the quality.
unlock_quality = function(quality) end;
---Unlocks the planet to be accessible to this force.
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#unlock_space_location)
---@param name SpaceLocationID Name of the planet.
unlock_space_location = function(name) end;
---Unlocks the space platforms, which enables the space platforms button
---
---[View Documentation](https://lua-api.factorio.com/latest/classes/LuaForce.html#unlock_space_platforms)
unlock_space_platforms = function() end;
}
end
