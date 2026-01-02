local wezterm = require 'wezterm'

local default_config = {
    -- -- Terminal
    -- default_prog = { 'zsh', '-l' },
    -- initial_cols = 120,
    -- initial_rows = 30,
    -- scrollback_lines = 10000,
    enable_scroll_bar = false,

    -- -- Terminal behavior
    automatically_reload_config = true,
    -- exit_behavior = 'CloseOnCleanExit',
    -- window_close_confirmation = 'NeverPrompt',

    -- -- Appearance
    -- color_scheme = "Tokyo Night Storm",
    color_scheme = 'Monokai Soda',

    window_decorations = "RESIZE",

    window_padding = {
      left = 2,
      right = 2,
      top = 10,
      bottom = 0,
    },


    window_background_opacity = 0.95,
    macos_window_background_blur = 20,
    
    tab_bar_at_bottom = false,
    tab_max_width = 32,
    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8
    },

    -- Font for tabbar (only work if use_fancy_tab_bar is true, BUT tabline line plugin override it to false)
    -- use_fancy_tab_bar = true,
    -- window_frame = {
    --   font = wezterm.font('DepartureMono Nerd Font', { weight = 'Medium' }),
    --   font_size = 13.0, 
    -- },

    font = wezterm.font("DroidSansM Nerd Font Mono", {
        weight = "Regular",
        stretch = "Normal",
        style = "Normal"
    }),
    -- font = wezterm.font("DepartureMono Nerd Font", {weight="Regular", stretch="Normal", style="Normal"}),
    -- font = wezterm.font('JetBrains Mono', { weight = 'Medium' }),
    font_size = 14,

}

return default_config
