--[[
This file is part of the mod InserterFuelLeech that is licensed under the
GNU GPL-3.0. See the file COPYING for a copy of the GNU GPLv3.0.
]]

--- @param value double
--- @param divisor double
--- @return double
function round(value, divisor)
    return math.floor(value / divisor + 0.5) * divisor
end

--- @type table<double,double?>
local squareRootsCache = {}

--- @param x double
--- @return double
function calcSquareRoot(x)
    local result = squareRootsCache[x]
    if result == nil then
        result = math.sqrt(x)
        squareRootsCache[x] = result
    end
    return result
end

--- Reduces the amount of significant digits of a vector's components
--- to make following calculations' results more cache friendly.
--- @param x double
--- @param y double
--- @param granularity double
--- @return double, double
function granularizeVector(x, y, granularity)
    return round(x, granularity), round(y, granularity)
end

--- Reduces the amount of significant digits of a vector's components
--- to make following calculations' results more cache friendly.
--- @param mapPos MapPosition.0
--- @param granularity double
--- @return double, double
function granularizeMapPos(mapPos, granularity)
    return granularizeVector(mapPos.x, mapPos.y, granularity)
end

--- Moves a vectors coordinate system from (0, 0) to given base.
--- @param x double
--- @param y double
--- @param baseX double
--- @param baseY double
--- @return double, double
function rebaseVector(x, y, baseX, baseY)
    return x - baseX, y - baseY
end

--- Reduces the amount of significant digits of a vector's components
--- to make following calculations' results more cache friendly.
--- @param mapPos MapPosition.0
--- @param granularity double
--- @param baseX double already granularized
--- @param baseY double already granularized
--- @return double, double
function granularizeAndRebaseMapPos(mapPos, granularity, baseX, baseY)
    local xGranularized, yGranularized = granularizeVector(mapPos.x, mapPos.y, granularity)
    return rebaseVector(xGranularized, yGranularized, baseX, baseY)
end

--- @param x double
--- @param y double
--- @return double
function calcVector2Length(x, y)
    return calcSquareRoot(x * x + y * y)
end

--- @param aX double
--- @param aY double
--- @param bX double
--- @param bY double
--- @return double
function calcVector2Distance(aX, aY, bX, bY)
    return calcVector2Length(aX - bX, aY - bY)
end

--- @type table<double,double?>
local calcAcosTurnsCache = {}

--- @param x double
--- @return double
function calcAcosTurns(x)
    local turns = calcAcosTurnsCache[x]
    if turns == nil then
        local roationAngleRad = math.acos(x) -- 0..Pi
        turns = roationAngleRad / math.pi / 2 -- 0..0.5
        calcAcosTurnsCache[x] = turns
    end
    return turns
end

--- All coordinates are assumed to be granularized and rebased.
--- @param startPosX double
--- @param startPosY double
--- @param destPosX double
--- @param destPosY double
--- @return double, double turns and extension
function calcVectorMinTurnsAndExtension(startPosX, startPosY, destPosX, destPosY)
    local handExtension = calcVector2Length(startPosX, startPosY)
    local destExtension = calcVector2Length(destPosX, destPosY)
    local extensionDiff = math.abs(handExtension - destExtension)

    local dotProduct = startPosX * destPosX + startPosY * destPosY
    local lengthProduct = handExtension * destExtension
    local roationAngleCos = lengthProduct ~= 0 and dotProduct / lengthProduct or 0 -- -1..1
    local turns = calcAcosTurns(roationAngleCos)
    if dotProduct < 0 then
        turns = 0.5 - turns
    end
    return turns, extensionDiff
end
