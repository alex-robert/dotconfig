local wezterm = require('wezterm')
local tabline = require 'plugins/tabline'


local function active_theme(window, pane)
    local effective_config = window:effective_config()
    local theme = string.format(
        "%s",
        effective_config.color_scheme
    )
    return theme
end



local state = {
  theme_name = 'nil',
  show_until = 0,
}

wezterm.on('theme-changed', function(window, theme_name)
  state.theme_name = theme_name
  wezterm.log_info 'Theme Changed'
  wezterm.emit('theme-show', window)
end)

wezterm.on('theme-reset-default', function(window, theme_name)
  state.theme_name = theme_name
  wezterm.log_info 'Theme should hide'
  wezterm.emit('theme-hide', window)
end)


return {
  'theme_notification',
  events = {
    show = 'theme-show',
    hide = 'theme-hide',
    -- delay = 60
  },
  sections = {
    tabline_c = {
      active_theme
    }
  },
  theme = {
    c = {
      fg = '#ffffff'
    }
  }
}
