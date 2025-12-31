local wezterm = require 'wezterm'
local tabline = require 'plugins/tabline'

local leader_ext = require 'tabline_leader_ext'

local function active_theme(window, pane)
    local effective_config = window:effective_config()
    local theme = string.format(
        "%s",
        effective_config.color_scheme
    )

    return theme
end


local tabline_config = {
  options = {
    icons_enabled = true,

    -- theme = 'Tokyo Night Storm',
    -- theme = 'Catppuccin Mocha',
    theme = 'GruvboxDark',

    tabs_enabled = true,
    section_separators = {
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

    -- Tokyo Night Storm inspired colors with blue/teal accents
    theme_overrides = {
      -- normal = {
      --   a = { fg = '#1a1b26', bg = '#7aa2f7' },  -- blue accent for normal mode
      --   b = { fg = '#7aa2f7', bg = '#24283b' },
      --   c = { fg = '#a9b1d6', bg = '#1f2335' },
      -- },
      window_mode = {
        a = { fg = '#1a1b26', bg = '#bb9af7' },  -- purple for window mode
        b = { fg = '#bb9af7', bg = '#24283b' },
        c = { fg = '#a9b1d6', bg = '#1f2335' },
      },
      workspace_mode = {
        a = { fg = '#1a1b26', bg = '#7dcfff' },  -- cyan for workspace mode
        b = { fg = '#7dcfff', bg = '#24283b' },
        c = { fg = '#a9b1d6', bg = '#1f2335' },
      }
    },
    
    -- section_separators = '',
    -- component_separators = '',
    -- tab_separators = '',
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
            return wezterm.nerdfonts.cod_terminal .. ' TERM'
          elseif str == 'WINDOW' then
             return wezterm.nerdfonts.md_window_restore .. ' WINDOW'
           elseif str == 'WORKSPACE' then
             return wezterm.nerdfonts.md_view_dashboard .. ' WORKSPACE'
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
      -- { 'parent', padding = 0 },
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
    -- 'resurrect.state_manager.periodic_save',
    leader_ext
  },
}

-- 'ram', 'cpu'

return tabline_config
