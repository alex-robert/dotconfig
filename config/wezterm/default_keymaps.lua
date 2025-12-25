local wezterm = require 'wezterm'

local bindings = { -- Debug
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
},
{
    key = 'l',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ActivateTabRelative(1)
}, {
    key = 'j',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ActivateTabRelative(-1)
}, -- Panes
{
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane {
        confirm = true
    }
}, 

 {
    key = 'i',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Up'
}, {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Down'
}, {
    key = 'j',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Left'
}, {
    key = 'l',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Right'
}, 


-- Word navigation (Option + arrows)
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
}, 
}


return {
    leader = {
        key = 'Space',
        mods = 'CTRL',
        timeout_milliseconds = 1500
    },
    key_tables = {},
    keys = bindings
}
