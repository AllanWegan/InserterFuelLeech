--[[
This file is part of the mod InserterFuelLeech that is licensed under the
GNU GPL-3.0. See the file COPYING for a copy of the GNU GPLv3.0.
]]

--- @class PlayerSettingsCache
--- @field player LuaPlayer
--- @field playerIndex integer
--- @field chatLogColor Color
--- @field logDiscoveryCycle boolean
--- @field watchLastInserter boolean

--- @class SettingsCache
--- @field inserterTypes table<string?,boolean?>
--- @field selfLeechFromDropEnabled boolean
--- @field selfRefuelCheatEnabled boolean
--- @field vectorGranularity double
--- @field pickupPosMarginTicks uint
--- @field discoverPerTick uint
--- @field noUseForFuelNextUpdateTicks uint
--- @field unpoweredElectricNextUpdateTicks uint
--- @field unpoweredBurnerNextUpdateTicksWhenCheatEnabled uint
--- @field unpoweredBurnerNextUpdateTicksWhenCheatDisabled uint
--- @field stuckWithItemNextUpdateTicks uint
--- @field nothingLeechableFoundNextUpdateTicks uint
--- @field nextUpdateTicksMinForVariation uint
--- @field nextUpdateTicksVariation uint
--- @field cmdPrefix string
--- @field logDiscoveryCycle boolean
--- @field logDiscoveryCyclePlayers table<integer?,PlayerSettingsCache?>
--- @field watchLastInserter boolean
--- @field watchLastInserterPlayers table<integer?,PlayerSettingsCache?>

--- @type SettingsCache
settingsCache = {
    inserterTypes = {},
    selfLeechFromDropEnabled = false,
    selfRefuelCheatEnabled = false,
    vectorGranularity = 0.01,
    minFuelItems = 1,
    pickupPosMarginTicks = 6,
    discoverPerTick = 1,
    noUseForFuelNextUpdateTicks = 30 * 60,
    unpoweredElectricNextUpdateTicks = 10 * 60,
    unpoweredBurnerNextUpdateTicksWhenCheatEnabled = 30 * 60,
    unpoweredBurnerNextUpdateTicksWhenCheatDisabled = 30 * 60,
    stuckWithItemNextUpdateTicks = 3 * 60,
    nothingLeechableFoundNextUpdateTicks = 3 * 60,
    nextUpdateTicksMinForVariation = 55,
    nextUpdateTicksVariation = 60,
    cmdPrefix = "ifl",
    logDiscoveryCycle = false,
    logDiscoveryCyclePlayers = {},
    watchLastInserter = false,
    watchLastInserterPlayers = {},
}

--- @type (fun(settingsCache: SettingsCache): nil)[]
local updateHandlers = {}

---@param handler fun(settingsCache: SettingsCache): nil
---@return nil
function registerSettingsUpdateHandler(handler)
    updateHandlers[#updateHandlers + 1] = handler
end

local settingsCacheUninitialized = true

---@return nil
function initSettingsCacheIfNeeded()
    if settingsCacheUninitialized then
        updateSettingsCache()
    end
    settingsCacheUninitialized = false
end

---@return nil
function updateSettingsCache()
    local inserterTypeSet = settings.global["inserter-fuel-leech-inserters-enabled"].value
    if inserterTypeSet == "all" then
        settingsCache.inserterTypes = getInserterTypes()
    elseif inserterTypeSet == "itemfueled" then
        settingsCache.inserterTypes = getItemFueledInserterTypes()
    else
        settingsCache.inserterTypes = {}
    end
    settingsCache.selfLeechFromDropEnabled = settings.global["inserter-fuel-leech-self-leech-from-drop-enabled"].value
    settingsCache.selfRefuelCheatEnabled = settings.global["inserter-fuel-leech-self-refuel-cheat-enabled"].value

    settingsCache.pickupPosMarginTicks = settings.global["inserter-fuel-leech-pickup-margin-ticks"].value
    settingsCache.discoverPerTick = settings.global["inserter-fuel-leech-discover-per-tick"].value
    settingsCache.cmdPrefix = settings.global["inserter-fuel-leech-cmd-prefix"].value

    settingsCache.logDiscoveryCycle = false
    settingsCache.logDiscoveryCyclePlayers = {}
    settingsCache.watchLastInserter = false
    settingsCache.watchLastInserterPlayers = {}
    for _, player in pairs(game.connected_players) do
        updatePlayerSettingsCache(player)
    end

    for i = 1, #updateHandlers do
        updateHandlers[i](settingsCache)
    end
end

--- @param player (integer|LuaPlayer)?
--- @return nil
function updatePlayerSettingsCache(player)
    if not player then
        return
    end
    if type(player) == "number" then
        updatePlayerSettingsCache(game.players[player])
        return
    end
    if not player.valid then
        return
    end
    local playerIndex = player.index
    local playerSettings = player.connected and {
        player            = player,
        chatLogColor      = player.mod_settings["inserter-fuel-leech-chat-log-color"].value,
        logDiscoveryCycle = player.mod_settings["inserter-fuel-leech-log-discovery-cycle"].value,
        watchLastInserter = player.mod_settings["inserter-fuel-leech-watch-last-inserter"].value,
    } or nil
    settingsCache.logDiscoveryCyclePlayers[playerIndex] = playerSettings and playerSettings.logDiscoveryCycle and playerSettings or nil
    settingsCache.watchLastInserterPlayers[playerIndex] = playerSettings and playerSettings.watchLastInserter and playerSettings or nil
    settingsCache.logDiscoveryCycle = next(settingsCache.logDiscoveryCyclePlayers) ~= nil
    settingsCache.watchLastInserter = next(settingsCache.watchLastInserterPlayers) ~= nil
end

--- @param player (integer|LuaPlayer)?
--- @param playersSettingsCache table<integer,PlayerSettingsCache?>
--- @return PlayerSettingsCache?
function getPlayerSettingsCache(player, playersSettingsCache)
    if type(player) == "number" then
        return playersSettingsCache[player]
    end
    if not player or not player.valid then
        return nil
    end
    return playersSettingsCache[player.index]
end
