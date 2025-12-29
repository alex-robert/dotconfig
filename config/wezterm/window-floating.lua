local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Window appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.initial_cols = 120
config.initial_rows = 40
config.window_padding = { 
    left = 20, 
    right = 20, 
    top = 10, 
    bottom = 10 
}

config.window_frame = {
    font = wezterm.font { family = 'SF Mono', weight = 'Bold' },
    font_size = 11.0,
}

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
    window:set_title("floating-cheat")
end)

wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
    return "floating-cheat"
end)

return config
