--[[
This file is part of the mod InserterFuelLeech that is licensed under the
GNU GPL-3.0. See the file COPYING for a copy of the GNU GPLv3.0.
]]

--- @param data any
--- @param indent string
--- @return string
local function serialize(data, indent)
    if type(data) == "table" then
        --- @type string[]
        local lines = {}
        for k, v in pairs(data) do
            lines[#lines+1] = "\n"
            lines[#lines+1] = indent
            if type(k) == "string" then
                lines[#lines+1] = k
            else
                lines[#lines+1] = serpent.line(k)
            end
            lines[#lines+1] = ": "
            lines[#lines+1] = serialize(v, ".   " .. indent)
        end
        return table.concat(lines)
    else
        return serpent.line(data)
    end
end

local secondTicks = 60
local minuteTicks = secondTicks * 60
local hourTicks = minuteTicks * 60
local dayTicks = hourTicks * 24
--- @param ticks uint
--- @return string
function formatTickForLog(ticks)
    local accu = ticks
    ticks = accu % 60
    accu = math.floor(accu / 60)
    local seconds = accu % 60
    accu = math.floor(accu / 60)
    local minutes = accu % 60
    accu = math.floor(accu / 60)
    local hours = accu % 24
    local days = math.floor(accu / 24)
    local result = ""
    if days > 0 then
        result = tostring(days) .. "d"
    end
    if string.len(result) ~= 0 or hours > 0 then
        result = result .. string.format("%02d:", hours)
    end
    if string.len(result) ~= 0 or minutes > 0 then
        result = result .. string.format("%02d:", minutes)
    end
    if string.len(result) ~= 0 or seconds > 0 then
        result = result .. string.format("%02d.", seconds)
    end
    result = result .. string.format("%02dt", ticks)
    return result
end

--- @param logFun fun(msg: string, color: Color): nil
--- @param msg string
--- @param data any
--- @param settings PrintSettings
--- @return nil
local function logToChat(logFun, msg, data, settings)
    msg = formatTickForLog(game.tick) .. " " .. script.mod_name .. ": " .. msg
    if data then
        if type(data) == "table" then
            msg = msg .. serialize(data, "")
        else
            msg = msg .. " data: " .. serialize(data, "")
        end
    end
    logFun(msg, settings)
end

--- @type PrintSettings
local gobalPrintSettings = {
    --color = {1,1,1,1},
    sound = defines.print_sound.never,
    game_state = true,
    skip = defines.print_skip.never,
}

--- @param msg string
--- @param data any
--- @param settings PrintSettings?
--- @return nil
function logToGlobalChat(msg, data, settings)
    logToChat(game.print, msg, data, settings or gobalPrintSettings)
end

--- @type PrintSettings
local playerPrintSettings = {
    color = {1,1,1,1},
    sound = defines.print_sound.never,
    game_state = false,
    skip = defines.print_skip.never,
}

--- @param playerSettings PlayerSettingsCache
--- @param msg string
--- @param data any
--- @param settings PrintSettings?
--- @return nil
function logToPlayerChat(playerSettings, msg, data, settings)
    settings = settings or playerPrintSettings
    settings.color = playerSettings.chatLogColor
    logToChat(playerSettings.player.print, msg, data, settings)
end

--- @param playersSettings table<any,PlayerSettingsCache?>
--- @param msg string
--- @param data any
--- @param settings PrintSettings?
--- @return nil
function logToPlayersChat(playersSettings, msg, data, settings)
    for _, playerSettings in pairs(playersSettings) do
        logToPlayerChat(playerSettings, msg, data, settings)
    end
end
