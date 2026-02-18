
local wezterm = require 'wezterm'

return {


  --- PANES ---
  -- Navigate Panes
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Up'
  }, {
    key = 'j',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Down'
  }, {
    key = 'h',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Left'
  }, {
    key = 'l',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Right'
  },

  -- Move panes
  {
    key = 'r',
    mods = 'SHIFT',
    action = wezterm.action.RotatePanes 'Clockwise'
  },

  -- Create new panes
  {
    key = 'h',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical {
      domain = 'CurrentPaneDomain'
    },

  },
  {
    key = 'v',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitHorizontal {
      domain = 'CurrentPaneDomain'
    },
  }, 

  -- Resize panes
  {
    key = 'K',
    mods = 'SHIFT',
    action = wezterm.action.AdjustPaneSize {'Up', 5}
  }, {
    key = 'J',
    mods = 'SHIFT',
    action = wezterm.action.AdjustPaneSize {'Down', 5}
  },
  {
    key = 'H',
    mods = 'SHIFT',
    action = wezterm.action.AdjustPaneSize {'Left', 5}
  }, {
    key = 'L',
    mods = 'SHIFT',
    action = wezterm.action.AdjustPaneSize {'Right', 5}
  },


  -- Close pane
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },

  -- Zoom and quit
  {
    key = 'z',
    mods = 'CMD',
    action = wezterm.action.Multiple {wezterm.action.TogglePaneZoomState, 'PopKeyTable'}
  },

  --- TABS ---
  {
    key = "t",
    mods = "CMD",
    action = wezterm.action {
      SpawnTab = "CurrentPaneDomain"
    }
  },
  {
    key = 'l',
    mods = 'CTRL|ALT',
    action = wezterm.action.ActivateTabRelative(1)
  },
  {
    key = 'h',
    mods = 'CTRL|ALT',
    action = wezterm.action.ActivateTabRelative(-1)
  },
  -- Move tabs
  {
    key = 'l',
    mods = 'CMD|CTRL|ALT',
    action = wezterm.action.MoveTabRelative(1)
  },
  {
    key = 'h',
    mods = 'CMD|CTRL|ALT',
    action = wezterm.action.MoveTabRelative(-1)
  },



  -- Quit
  {
    key = 'Escape',
    action = 'PopKeyTable'
  }
}
