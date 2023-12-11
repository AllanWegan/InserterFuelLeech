--[[
This file is part of the mod InserterFuelLeech that is licensed under the
GNU GPL-3.0. See the file COPYING for a copy of the GNU GPLv3.0.
]]

--- @param command CustomCommandData
--- @return boolean, string, nil|LuaPlayer
local function checkCommander(command)
    local playerIsServerAdmin = not command.player_index
    local player = playerIsServerAdmin and game.get_player(command.player_index)
    if not player then
        return true, "server console", nil
    end
    return player.admin, player.name, player
end

--- @param command CustomCommandData
--- @return nil
local function commandResetModState(command)
    local commanderIsAdmin, commanderName, _ = checkCommander(command)
    if not commanderIsAdmin then
        logToGlobalChat("Denied state reset from " .. commanderName .. " because not an admin.", nil)
        return
    end
    logToGlobalChat("State reset triggered by " .. commanderName .. "...", nil)
    initInserterRegistry(command.tick)
    initInserterDiscovery(command.tick)
    logToGlobalChat("State reset done.", nil)
end

--- @param command CustomCommandData
--- @return nil
local function commandShowStats(command)
    local commanderIsAdmin, commanderName, player = checkCommander(command)
    if not commanderIsAdmin then
        logToGlobalChat("Denied stats request from " .. commanderName .. " because not an admin.", nil)
        return
    end
    logToGlobalChat("Stats requested by " .. commanderName .. ".", nil)
    logToGlobalChat("", getInserterStats(command.tick))
end

--- @type nil|string
local lastCmdPrefix = nil

--- @param settings SettingsCache
--- @return nil
local function initConsoleCommands(settings)
    if lastCmdPrefix then
        commands.remove_command(lastCmdPrefix .. "reset")
        commands.remove_command(lastCmdPrefix .. "stats")
    end

    local newCmdPrefix = settings.cmdPrefix
    lastCmdPrefix = newCmdPrefix
    commands.add_command(
        newCmdPrefix .. "reset",
        "Reinitializes the Inserter Fuel Leech mod state including reregistrering all inserters.",
        commandResetModState
    )
    commands.add_command(
        newCmdPrefix .. "stats",
        "Prints Inserter Fuel Leech mod stats.",
        commandShowStats
    )
end

registerSettingsUpdateHandler(initConsoleCommands)
