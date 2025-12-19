local wezterm = require 'wezterm'

local function active_theme(window, pane)
    local effective_config = window:effective_config()
    local theme = string.format(
        "%s",
        effective_config.color_scheme
    )

    return theme
end


local function is_leader_active(window) 
  if window:leader_is_active() then
    return "LEADER"
  else
    return ""
  end
end

local tabline_config = {
  options = {
    icons_enabled = true,

    -- theme = 'Tokyo Night Storm',
    -- theme = 'Catppuccin Mocha',
    -- theme = 'GruvboxDark',

    tabs_enabled = true,
    theme_overrides = {},
    section_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_soft_divider,
    },
    component_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_soft_divider,
    },
    tab_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
    
    -- section_separators = '',
    -- component_separators = '',
    -- tab_separators = '',
  },
  sections = {
    tabline_a = { 
      'mode',
      padding = 14,
    },
    tabline_b = { 'workspace' },
    tabline_c = { is_leader_active },
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
    tabline_x = { '' },
    tabline_y = { 'cpu', 'ram', throttle = 10, },
    tabline_z = { 
      ''
      -- 'domain',
      -- icons_enabled = true,
      -- icons_only = true,
      -- domain_to_icon = {
      --   default = wezterm.nerdfonts.md_monitor,
      --   ssh = wezterm.nerdfonts.md_ssh,
      --   wsl = wezterm.nerdfonts.md_microsoft_windows,
      --   docker = wezterm.nerdfonts.md_docker,
      --   unix = wezterm.nerdfonts.cod_terminal_linux,
      -- }, 
    },
  },
  extensions = {
    'resurrect',
    'smart_workspace_switcher'
  },
}

-- 'ram', 'cpu'

return tabline_config
