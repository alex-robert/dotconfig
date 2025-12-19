local wezterm = require 'wezterm'

local default_config = {
    -- -- Terminal
    -- default_prog = { 'zsh', '-l' },
    -- initial_cols = 120,
    -- initial_rows = 30,
    -- scrollback_lines = 10000,

    -- -- Terminal behavior
    automatically_reload_config = true,
    -- exit_behavior = 'CloseOnCleanExit',
    -- window_close_confirmation = 'NeverPrompt',

    -- -- Appearance
    color_scheme = "Tokyo Night Storm",
    window_decorations = "RESIZE",
    window_background_opacity = 0.95,
    macos_window_background_blur = 20,
    -- hide_tab_bar_if_only_one_tab = true,
    tab_bar_at_bottom = true,
    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8
    },

    -- -- Font
    font = wezterm.font("DroidSansM Nerd Font Mono", {
        weight = "Regular",
        stretch = "Normal",
        style = "Normal"
    }),
    -- wezterm.font("FiraMono Nerd Font Mono", {weight="Regular", stretch="Normal", style="Normal"}),
    -- wezterm.font('JetBrains Mono', { weight = 'Medium' })
    font_size = 14.0,
}

return default_config
