--[[
This file is part of the mod InserterFuelLeech that is licensed under the
GNU GPL-3.0. See the file COPYING for a copy of the GNU GPLv3.0.
]]

local min = math.min
local max = math.max

local InserterRepoStateVersion = 546

--- @class InserterRepoTickState
--- @field lastInserterIndex uint
--- @field inserters LuaEntity[]

--- @class InserterRepoState
--- @field version uint32
--- @field registeredInserters table<LuaEntity,true?>
--- @field insertersByTickLength uint Length of the inserter update scheduling ring buffer in game ticks
--- @field insertersByTick InserterRepoTickState[] Index is tick % insertersByTickLength + 1
--- @field watchedInserterPlayers table<LuaEntity,integer?>
--- @field watchedPlayerInserters table<integer,LuaEntity?>

--- @param version uint32
--- @return InserterRepoState
local function makeInserterRegistryState(version)
    return {
        version = version,
        registeredInserters = {},
        insertersByTickLength = 3600,
        insertersByTick = {},
        watchedInserterPlayers = {},
        watchedPlayerInserters = {},
    }
end

--- @type InserterRepoState
local state = makeInserterRegistryState(0)

--- @type boolean
local inserterRepoStateUnknown = true

local function initInserterRepoIfNeeded(tick)
    if not state or state.version ~= InserterRepoStateVersion then
        logToGlobalChat("Initializing inserter repository state...", nil)

        state = makeInserterRegistryState(InserterRepoStateVersion)
        storage.inserterRepoState = state

        for _, surface in pairs(game.surfaces) do
            local surfaceInserters = surface.find_entities_filtered{type = "inserter"}
            for i = 1, #surfaceInserters do
                local inserter = surfaceInserters[i]
                registerInserter(tick, inserter, nil)
            end
        end

        logToGlobalChat("Initialized inserter repository state.", nil)
    end
    inserterRepoStateUnknown = false
end

--- @param tick uint
--- @return nil
function initInserterRegistry(tick)
    state = makeInserterRegistryState(0)
    inserterRepoStateUnknown = true
    initInserterRepoIfNeeded(tick) -- Does full initialization because of non-matching version.
end

--- @return nil
function inserterRepoOnLoad()
    state = storage.inserterRepoState -- Migrations are done on first use.
end

--- @class InserterRepoStats
--- @field knownInserters uint
--- @field knownInsertersByType table<string,uint>
--- @field knownInsertersNeedingFuelThemselves uint
--- @field knownInsertersNeedingFuelThemselvesByType table<string,uint>
--- @field knownInsertersWithTargetNeedingFuel uint
--- @field knownInsertersWithTargetNeedingFuelByType table<string,uint>

--- @param tick uint
--- @return InserterRepoStats
function getInserterStats(tick)
    _ = inserterRepoStateUnknown and initInserterRepoIfNeeded(tick)
    local knownInsertersCount = 0
    --- @type table<string,uint>
    local knownInsertersByType = {}
    local knownInsertersNeedingFuelThemselvesCount = 0
    --- @type table<string,uint>
    local knownInsertersNeedingFuelThemselvesByType = {}
    local knownInsertersWithTargetNeedingFuelCount = 0
    --- @type table<string,uint>
    local knownInsertersWithTargetNeedingFuelByType = {}
    for inserter, _ in pairs(state.registeredInserters) do
        if inserter and inserter.valid then

            knownInsertersCount = knownInsertersCount + 1
            knownInsertersByType[inserter.name] = (knownInsertersByType[inserter.name] or 0) + 1

            if inserter.burner then
                knownInsertersNeedingFuelThemselvesCount = knownInsertersNeedingFuelThemselvesCount + 1
                knownInsertersNeedingFuelThemselvesByType[inserter.name] = (knownInsertersNeedingFuelThemselvesByType[inserter.name] or 0) + 1
            end

            if inserter.drop_target and inserter.drop_target.burner then
                knownInsertersWithTargetNeedingFuelCount = knownInsertersWithTargetNeedingFuelCount + 1
                knownInsertersWithTargetNeedingFuelByType[inserter.name] = (knownInsertersWithTargetNeedingFuelByType[inserter.name] or 0) + 1
            end

        end
    end
    return {
        knownInserters = knownInsertersCount,
        knownInsertersByType = knownInsertersByType,
        knownInsertersNeedingFuelThemselves = knownInsertersNeedingFuelThemselvesCount,
        knownInsertersNeedingFuelThemselvesByType = knownInsertersNeedingFuelThemselvesByType,
        knownInsertersWithTargetNeedingFuel = knownInsertersWithTargetNeedingFuelCount,
        knownInsertersWithTargetNeedingFuelByType = knownInsertersWithTargetNeedingFuelByType,
    }
end

--- @param slotIndex uint
--- @return InserterRepoTickState
local function getInsertersByTickSlot(slotIndex)
    local slot = state.insertersByTick[slotIndex]
    if not slot then
        slot = {lastInserterIndex = 0, inserters = getEmptyTable()}
        state.insertersByTick[slotIndex] = slot
    end
    return slot
end

--- @param tick uint
--- @return uint
local function getInsertersByTickSlotIndex(tick)
    local insertersByTickLength = state.insertersByTickLength
    return tick % insertersByTickLength + 1
end

--- @alias LastInserterLogger fun(msg: string, data: any): nil

--- @param inserter LuaEntity
--- @return LastInserterLogger?
local function getInserterDebugLogger(inserter)
    if not settingsCache.watchLastInserter then
        return nil
    end
    local playerIndex = state.watchedInserterPlayers[inserter]
    local playerSettingsCache = settingsCache.watchLastInserterPlayers[playerIndex]
    if not playerSettingsCache then
        return nil
    end
    return function(msg, data) logToPlayerChat(playerSettingsCache, msg, data) end
end

--- @param tick uint
--- @param inserter LuaEntity
--- @param ticksToWait uint
--- @param debugLogger LastInserterLogger?
--- @return nil
local function scheduleNextInserterUpdate(tick, inserter, ticksToWait, debugLogger)
    local insertersByTickLength = state.insertersByTickLength
    ticksToWait = max(1, min(insertersByTickLength, ticksToWait))
    local nextUpdateTick = tick + ticksToWait
    local nextUpdateSlotIndex = getInsertersByTickSlotIndex(nextUpdateTick)
    local nextUpdateSlot = getInsertersByTickSlot(nextUpdateSlotIndex)
    local nextUpdateSlotLastIndex = nextUpdateSlot.lastInserterIndex + 1
    nextUpdateSlot.lastInserterIndex = nextUpdateSlotLastIndex
    nextUpdateSlot.inserters[nextUpdateSlotLastIndex] = inserter
    _ = debugLogger and debugLogger("Next watched inserter update in " .. formatTickForLog(ticksToWait) .. ".", nil)
end

--- @param tick uint
--- @return nil
function updateInserters(tick)
    _ = inserterRepoStateUnknown and initInserterRepoIfNeeded(tick)
    local slotIndex = getInsertersByTickSlotIndex(tick)
    local slot = getInsertersByTickSlot(slotIndex)
    local slotInserters = slot.inserters
    local slotInsertersLength = slot.lastInserterIndex
    slot.lastInserterIndex = 0
    slot.inserters = getEmptyTable()

    local enabledInserterTypes = settingsCache.inserterTypes
    for inserterIndex = 1, slotInsertersLength do
        local inserter = slotInserters[inserterIndex]
        local debugLogger = getInserterDebugLogger(inserter)

        if not inserter.valid then
            _ = debugLogger and debugLogger("Watched inserter became invalid.", nil)
            state.registeredInserters[inserter] = nil
            local oldLastInserterPlayer = state.watchedInserterPlayers[inserter]
            if oldLastInserterPlayer then
                state.watchedInserterPlayers[inserter] = nil
                state.watchedPlayerInserters[oldLastInserterPlayer] = nil
            end
        elseif not enabledInserterTypes[inserter.name] then
            _ = debugLogger and debugLogger("Handling of watched inserter has been disabled.", nil)
            state.registeredInserters[inserter] = nil
            local oldLastInserterPlayer = state.watchedInserterPlayers[inserter]
            if oldLastInserterPlayer then
                state.watchedInserterPlayers[inserter] = nil
                state.watchedPlayerInserters[oldLastInserterPlayer] = nil
            end
        else
            local ticksToWait = updateInserter(inserter, debugLogger)
            scheduleNextInserterUpdate(tick, inserter, ticksToWait, debugLogger)
        end
    end

    recycleTable(slotInserters)
end

--- @param tick uint
--- @param inserter LuaEntity?
--- @param builderPlayerIndex uint32?
--- @return nil
function registerInserter(tick, inserter, builderPlayerIndex)
    _ = inserterRepoStateUnknown and initInserterRepoIfNeeded(tick)
    if not inserter or not inserter.valid or inserter.type ~= "inserter" or state.registeredInserters[inserter] or not settingsCache.inserterTypes[inserter.name] then
        return
    end

    if settingsCache.watchLastInserter and builderPlayerIndex and settingsCache.watchLastInserterPlayers[builderPlayerIndex] then
        local oldLastInserter = state.watchedPlayerInserters[builderPlayerIndex]
        if oldLastInserter then
            state.watchedInserterPlayers[oldLastInserter] = nil
            state.watchedPlayerInserters[builderPlayerIndex] = nil
        end
        state.watchedInserterPlayers[inserter] = builderPlayerIndex
        state.watchedPlayerInserters[builderPlayerIndex] = inserter
    end

    local debugLogger = getInserterDebugLogger(inserter)
    _ = debugLogger and debugLogger("Watching newly built " .. inserter.name .. ".", nil)
    state.registeredInserters[inserter] = true
    scheduleNextInserterUpdate(tick, inserter, 1, debugLogger)
end
