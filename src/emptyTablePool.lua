-- -----------------------------------------------------------------------------
-- Empty table pool to reduce object construction/destruction

local rawget = rawget
local rawset = rawset

--- @type table[]
local emptyTables = {}
local emptyTablesCount = 0

--- @param table table
--- @return nil
function recycleTable(table)
    if emptyTablesCount >= 1000 then
        return
    end
    for key in next, table do
        rawset(table, key, nil)
    end
    emptyTablesCount = emptyTablesCount + 1
    rawset(emptyTables, emptyTablesCount, table)
end

--- @return {}
function getEmptyTable()
    if emptyTablesCount ~= 0 then
        local table = rawget(emptyTables, emptyTablesCount)
        emptyTablesCount = emptyTablesCount - 1
        return table
    end
    return {}
end
