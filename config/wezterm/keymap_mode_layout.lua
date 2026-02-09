
local wezterm = require 'wezterm'

return {
  -- Manage window/tabs/panes layout
  {
    key = 'i',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Up'
  }, {
    key = 'k',
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
  -- Resize and stay
  {
    key = 'I',
    mods = 'SHIFT',
    action = wezterm.action.AdjustPaneSize {'Up', 5}
  }, {
    key = 'K',
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

  {
    key = 'r',
    action = wezterm.action.RotatePanes 'Clockwise'
  },

  -- Create new panes
  {
    key = 'u',
    action = wezterm.action.SplitVertical {
      domain = 'CurrentPaneDomain'
    }
  }, {
    key = 'p',
    action = wezterm.action.SplitHorizontal {
      domain = 'CurrentPaneDomain'
    }
  },
  {
    key = 'x',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },

  -- Zoom and quit
  {
    key = 'z',
    action = wezterm.action.Multiple {wezterm.action.TogglePaneZoomState, 'PopKeyTable'}
  },
  -- Quit
  {
    key = 'Escape',
    action = 'PopKeyTable'
  }
}
