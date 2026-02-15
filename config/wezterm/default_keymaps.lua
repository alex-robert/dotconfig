local wezterm = require 'wezterm'

local bindings = {

  -- Debug
  {
    key = 'd',
    mods = 'LEADER',
    action = wezterm.action.ShowDebugOverlay
  },
  {
    key = 'r',
    mods = 'LEADER',
    action = wezterm.action.ReloadConfiguration,
  },

  --Command palette
  {

    key = 'p',
    mods = 'LEADER',
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

  {
    key = 'l',
    mods = 'LEADER|CMD',
    action = wezterm.action.ActivateTabRelative(1)
  },
  {
    key = 'h',
    mods = 'LEADER|CMD',
    action = wezterm.action.ActivateTabRelative(-1)
  },


  --- Panes ---
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane {
      confirm = true
    }
  },
  {
    key = 'z',
    mods = 'LEADER|CMD',
    action = wezterm.action.TogglePaneZoomState
  },


  -- navigate Panes
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

  -- Panes size
  {
    key = 'H',
    mods = 'CMD|SHIFT',
    action = wezterm.action.AdjustPaneSize {'Left', 5}
  },
  {
    key = 'J',
    mods = 'CMD|SHIFT',
    action = wezterm.action.AdjustPaneSize {'Down', 5}
  },
  {
    key = 'K',
    mods = 'CMD|SHIFT',
    action = wezterm.action.AdjustPaneSize {'Up', 5}
  },
  {
    key = 'L',
    mods = 'CMD|SHIFT',
    action = wezterm.action.AdjustPaneSize {'Right', 5}
  },

  --- MacOS word & line navigation ---
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
