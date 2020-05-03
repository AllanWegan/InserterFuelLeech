--[[
This file is part of the mod inserter-fuel-leech that is licensed under
the GNU GPL-3.0. See the file COPYING for a copy of the GNU GPLv3.0.
]]
data:extend({
    {
        name = "inserter-fuel-leech-min-fuel-items",
        type = "int-setting",
        order = "10",
        setting_type = "runtime-global",
        minimum_value = 1,
        maximum_value = 1000,
        default_value = 5,
    },
    {
        name = "inserter-fuel-leech-ticks-between-updates",
        type = "int-setting",
        order = "20",
        setting_type = "runtime-global",
        minimum_value = 1,
        maximum_value = 1000,
        default_value = 90,
    },
    {
        name = "inserter-fuel-leech-pickup-pos-variation",
        type = "double-setting",
        order = "23",
        setting_type = "runtime-global",
        minimum_value = 0.01,
        maximum_value = 10.00,
        default_value = 0.3,
    },
    {
        name = "inserter-fuel-leech-self-refuel-cheat-enabled",
        type = "bool-setting",
        order = "80",
        setting_type = "runtime-global",
        default_value = true,
    },
})
