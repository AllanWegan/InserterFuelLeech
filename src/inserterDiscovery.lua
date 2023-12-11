--[[
This file is part of the mod InserterFuelLeech that is licensed under the
GNU GPL-3.0. See the file COPYING for a copy of the GNU GPLv3.0.
]]

--[[
Inserter (re-)discovery to eventually rediscover inserters which didn't need
management before but do now or have been discarded or missed by the event handlers.
]]

local InserterDiscoveryStateVersion = 326

--- @class InserterDiscoveryState
--- @field version uint
--- @field surfaces LuaSurface[]
--- @field surfaceIndex uint
--- @field cycleSurfacesCount uint
--- @field inserters LuaEntity[]
--- @field inserterIndex uint
--- @field cycleInsertersCount uint
--- @field cycleNewInsertersCount uint

--- @return InserterDiscoveryState
local function makeInserterDiscoveryState()
    return {
        version = InserterDiscoveryStateVersion,
        surfaces = {},
        surfaceIndex = 0,
        cycleSurfacesCount = 0,
        inserters = {},
        inserterIndex = 0,
        cycleInsertersCount = 0,
        cycleNewInsertersCount = 0,
    }
end

--- @type InserterDiscoveryState
local state = makeInserterDiscoveryState()

--- @param tick uint
--- @param logger Logger?
--- @return nil
function initInserterDiscovery(tick, logger)
    logger = logger or getLogger(settingsCache.logLowTrafficPlayers, false)
    state = makeInserterDiscoveryState()
    storage.inserterDiscoveryState = state
    logger("Initialized inserter discovery state.", nil)
end

--- @param tick uint
--- @return nil
local function initInserterDiscoveryIfNeeded(tick)
    if not state or state.version ~= InserterDiscoveryStateVersion then
        initInserterDiscovery(tick, nil)
    end
end

--- @return nil
function inserterDiscoveryOnLoad()
    state = storage.inserterDiscoveryState
end

--- @param tick uint
--- @return nil
function discoverUnknownInserters(tick)
    initInserterDiscoveryIfNeeded(tick)
    local discoverPerTick = settingsCache.discoverPerTick
    if discoverPerTick < 1 then
        return
    end
    local inserters = state.inserters
    local inserterIndex = state.inserterIndex
    local insertersCount = state.cycleInsertersCount
    local newInsertersCount = state.cycleNewInsertersCount

    -- inserters:
    if inserterIndex > 0 then
        for _ = 1, discoverPerTick do
            if inserterIndex > 0 then
                local inserter = inserters[inserterIndex]
                if inserter and inserter.valid then
                    insertersCount = insertersCount + 1
                    if registerInserter(tick, inserter, nil) then
                        newInsertersCount = newInsertersCount + 1
                    end
                end
            end
            inserterIndex = inserterIndex - 1
        end
        state.inserterIndex = inserterIndex
        state.cycleInsertersCount = insertersCount
        state.cycleNewInsertersCount = newInsertersCount
        return
    end

    -- surface:
    local surfaces = state.surfaces
    local surfaceIndex = state.surfaceIndex
    local surfacesCount = state.cycleSurfacesCount
    if surfaceIndex > 0 then
        local surface = surfaces[surfaceIndex]
        if surface and surface.valid then
            surfacesCount = surfacesCount + 1
            inserters = surface.find_entities_filtered{type = "inserter"}
            inserterIndex = #inserters
            state.inserters = inserters
            state.inserterIndex = inserterIndex
        end
        surfaceIndex = surfaceIndex - 1
        state.surfaceIndex = surfaceIndex
        state.cycleSurfacesCount = surfacesCount
        return
    end

    -- New cycle:
    if insertersCount ~= 0 then
        local logPlayers = settingsCache.logDiscoveryCyclePlayers
        logMsg(logPlayers, false, table.concat({
            "Inserter discovery cycle complete. Found ",
            insertersCount,
            " inserters (",
            newInsertersCount,
            " new) on ",
            surfacesCount,
            " surfaces.",
        }), nil)
    end
    surfaces = {}
    surfaceIndex = 0
    for _, surface in pairs(game.surfaces) do
        surfaceIndex = surfaceIndex + 1
        surfaces[surfaceIndex] = surface
    end
    state.surfaces = surfaces
    state.surfaceIndex = surfaceIndex
    state.cycleSurfacesCount = 0
    state.inserters = {}
    state.inserterIndex = 0
    state.cycleInsertersCount = 0
    state.cycleNewInsertersCount = 0
end
