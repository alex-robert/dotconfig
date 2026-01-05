local wezterm = require 'wezterm'
local tabline = require 'plugins/tabline'

local leader_ext = require 'tabline_leader_ext'
local theme_ext = require 'tabline_theme_ext'



local tabline_config = {
  options = {
    icons_enabled = true,

    -- theme = 'Tokyo Night Storm',
    -- theme = 'Catppuccin Mocha',
    -- theme = 'GruvboxDark',
    theme = 'Monokai Soda',

    tabs_enabled = true,
    section_separators = {
      -- left = wezterm.nerdfonts.pl_left_hard_divider,
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
    component_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_soft_divider,
    },
    tab_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },

    theme_overrides = {
      workspace_mode = {
        a = { fg = '#1a1b26', bg = '#bb9af7' },  -- cyan for workspace mode
        b = { fg = '#bb9af7', bg = '#24283b' },
        c = { fg = '#a9b1d6', bg = '#1f2335' },
      },
      layout_mode = {
        a = { fg = '#1a1b26', bg = '#bb9af7' },  -- cyan for workspace mode
        b = { fg = '#bb9af7', bg = '#24283b' },
        c = { fg = '#a9b1d6', bg = '#1f2335' },
      },
      tab = {
        inactive = {
          fg = '#a9b1d6',
        },
        active = {
          fg = '#1a1b26', 
          bg = '#a9b1d6',
        }
      }
    },
  },
  sections = {
    tabline_a = {
      {
        'mode',
        icons_enabled = true,
        padding = { left = 2, right = 2 },
        fmt = function(str)
          -- Use icons for modes
          if str == 'NORMAL' then
            return wezterm.nerdfonts.cod_terminal .. ' '
           elseif str == 'WORKSPACE' then
             return wezterm.nerdfonts.md_view_dashboard .. ' WORKSPACE'
           elseif str == 'LAYOUT' then
             return wezterm.nerdfonts.md_window_closed_variant .. ' LAYOUT'
          elseif str == 'SEARCH' then
            return str
          end
          return str
        end
      }

      --
    },
    tabline_b = { 'workspace' },
    tabline_c = { '' },
    tab_active = {
      'index',
      '|',
      'process',
      '',
      { 'cwd', padding = { left = 0, right = 1 } },
      { 'zoomed', padding = 0 },
    },
    tab_inactive = { 
      'index', 
      '',
      'process',
      '',
      { 'cwd', padding = { left = 0, right = 1 } },

    },
    tabline_x = { ' ' },
    tabline_y = { 'cpu', 'ram', throttle = 10, },
    tabline_z = {
      {
        'domain',
        icons_enabled = true,
        icons_only = true,
        domain_to_icon = {
          default = wezterm.nerdfonts.md_monitor,
          ssh = wezterm.nerdfonts.md_ssh,
          wsl = wezterm.nerdfonts.md_microsoft_windows,
          docker = wezterm.nerdfonts.md_docker,
          unix = wezterm.nerdfonts.cod_terminal_linux,
        },
        padding = 2,
      },
    },
  },
  extensions = {
    'resurrect',
    'smart_workspace_switcher',
    leader_ext,
    theme_ext,
  },
}

-- 'ram', 'cpu'

return tabline_config
