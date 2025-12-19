local wezterm = require 'wezterm'

local bindings = { 
-- Debug
{
    key = 'L',
    mods = 'CTRL',
    action = wezterm.action.ShowDebugOverlay
}, -- Tabs
{
    key = "t",
    mods = "CMD",
    action = wezterm.action {
        SpawnTab = "CurrentPaneDomain"
    }
}, -- Word navigation (Option + arrows)
{
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action.SendKey {
        key = 'b',
        mods = 'ALT'
    }
}, {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendKey {
        key = 'f',
        mods = 'ALT'
    }
}, -- Line beginning/end (Cmd + left/right)
{
    key = 'LeftArrow',
    mods = 'CMD',
    action = wezterm.action.SendKey {
        key = 'a',
        mods = 'CTRL'
    }
}, {
    key = 'RightArrow',
    mods = 'CMD',
    action = wezterm.action.SendKey {
        key = 'e',
        mods = 'CTRL'
    }
}}

return {
    leader = {
        key = 'a',
        mods = 'CTRL',
        timeout_milliseconds = 1000
    },
    keys = bindings
}
