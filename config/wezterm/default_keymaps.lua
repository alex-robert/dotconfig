local wezterm = require 'wezterm'

local bindings = {

-- Debug
{
    key = 'd',
    mods = 'CMD|CTRL|ALT',
    action = wezterm.action.ShowDebugOverlay
},

--Command palette
{

    key = 'P',
    mods = 'CMD',
    action = wezterm.action.ActivateCommandPalette,
},


-- Tabs
{
    key = "t",
    mods = "CMD",
    action = wezterm.action {
        SpawnTab = "CurrentPaneDomain"
    }
},
{
    key = 'l',
    mods = 'CMD|CTRL|ALT',
    action = wezterm.action.ActivateTabRelative(1)
},
{
    key = 'h',
    mods = 'CMD|CTRL|ALT',
    action = wezterm.action.ActivateTabRelative(-1)
},

-- Panes
{
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane {
        confirm = true
    }
},

-- Pane navigation (HJKL)
{
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Up'
},
{
    key = 'j',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Down'
},
{
    key = 'h',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Left'
},
{
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
},
{
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendKey {
        key = 'f',
        mods = 'ALT'
    }
},

-- Line beginning/end (Cmd + left/right)
{
    key = 'LeftArrow',
    mods = 'CMD',
    action = wezterm.action.SendKey {
        key = 'a',
        mods = 'CTRL'
    }
},
{
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
        key = 'a',
        mods = 'CMD',
        timeout_milliseconds = 1500
    },
    key_tables = {},
    keys = bindings
}
