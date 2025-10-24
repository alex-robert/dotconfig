local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
    -- Color scheme
    config.color_scheme = 'Tokyo Night'

    -- Window appearance
    config.window_decorations = 'RESIZE'
    config.window_background_opacity = 0.95
    config.macos_window_background_blur = 20

    -- Cursor
    config.default_cursor_style = 'BlinkingBlock'
    config.cursor_blink_rate = 800

    -- Scrollbar
    config.enable_scroll_bar = false

    -- Window padding
    config.window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10
    }

    -- Status bar (optional)
    config.status_update_interval = 1000

    wezterm.on('update-right-status', function(window, pane)
        local date = wezterm.strftime('%Y-%m-%d %H:%M:%S')
        window:set_right_status(wezterm.format({{
            Text = date .. '  '
        }}))
    end)
end

return module
