local wezterm = require 'wezterm'

local function maximize_window(window)
    -- wezterm.log_info('maximize_window called')
    local screen = wezterm.gui.screens().main
    local gui_window = window:gui_window()
    gui_window:set_position(0, 0)
    gui_window:set_inner_size(screen.width, screen.height)
end

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
    maximize_window(window)
end)

wezterm.on('window-config-reloaded', function(window)
    maximize_window(window)
end)

return {
    color_scheme = "Tokyo Night Storm",
    font = wezterm.font("DroidSansM Nerd Font Mono", {
        weight = "Regular",
        stretch = "Normal",
        style = "Normal"
    }),
    -- wezterm.font("FiraMono Nerd Font Mono", {weight="Regular", stretch="Normal", style="Normal"}),

    font_size = 14.0,
    window_decorations = "RESIZE",
    window_background_opacity = 0.95,
    macos_window_background_blur = 20,
    hide_tab_bar_if_only_one_tab = true,
    tab_bar_at_bottom = true,
    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8
    },

    -- Key bindings (mac-friendly)
    keys = {
        {
            key = "t",
            mods = "CMD",
            action = wezterm.action {
                SpawnTab = "CurrentPaneDomain"
            }
        }, 
        -- Last closed pane will close the current tab/window
        {
            key = "w",
            mods = "CMD",
            action = wezterm.action.CloseCurrentPane { confirm = false },
        }, 
        -- Split tabs / window
        -- {
        --     key = "s",
        --     mods = "SHIFT",
        --     action = wezterm.action { SplitHorizontal = {
        --             domain = "CurrentPaneDomain"
        --         }
        --     }
        -- }, {
        --     key = "d",
        --     mods = "SHIFT",
        --     action = wezterm.action { SplitVertical = {
        --             domain = "CurrentPaneDomain"
        --         }
        --     }
        -- }, 
        -- Pane / tab navigation
        

        -- Word navigation (Option + arrows)
        {
            key = 'LeftArrow',
            mods = 'OPT',
            action = wezterm.action.SendKey { key = 'b', mods = 'ALT' }
        }, {
            key = 'RightArrow',
            mods = 'OPT',
            action = wezterm.action.SendKey { key = 'f', mods = 'ALT'}
        }, 

        -- Line beginning/end (Cmd + left/right)
        {
            key = 'LeftArrow',
            mods = 'CMD',
            action = wezterm.action.SendKey { key = 'a', mods = 'CTRL'}
        }, {
            key = 'RightArrow',
            mods = 'CMD',
            action = wezterm.action.SendKey { key = 'e', mods = 'CTRL'}
        }
    }
}
