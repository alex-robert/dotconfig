local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
    config.keys = { -- Text movement (Option + arrows for word navigation)
    {
        key = 'LeftArrow',
        mods = 'OPT',
        action = wezterm.action.SendKey {
            key = 'b',
            mods = 'ALT'
        }
    }, {
        key = 'RightArrow',
        mods = 'OPT',
        action = wezterm.action.SendKey {
            key = 'f',
            mods = 'ALT'
        }
    }, -- Line beginning/end (Cmd + left/right)
    {
        key = 'LeftArrow',
        mods = 'CMD',
        action = wezterm.action.SendKey {
            key = 'a',
            mods = 'CTRL'
        }
    }, {
        key = 'RightArrow',
        mods = 'CMD',
        action = wezterm.action.SendKey {
            key = 'e',
            mods = 'CTRL'
        }
    }, -- Pane navigation with your movement keys (i,j,k,l)
    {
        key = 'i',
        mods = 'CMD',
        action = wezterm.action.ActivatePaneDirection 'Up'
    }, {
        key = 'k',
        mods = 'CMD',
        action = wezterm.action.ActivatePaneDirection 'Down'
    }, {
        key = 'j',
        mods = 'CMD',
        action = wezterm.action.ActivatePaneDirection 'Left'
    }, {
        key = 'l',
        mods = 'CMD',
        action = wezterm.action.ActivatePaneDirection 'Right'
    }, -- Tab navigation
    {
        key = ']',
        mods = 'CMD',
        action = wezterm.action.ActivateTabRelative(1)
    }, {
        key = '[',
        mods = 'CMD',
        action = wezterm.action.ActivateTabRelative(-1)
    }, -- Pane management
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane {
            confirm = true
        }
    }, {
        key = 'd',
        mods = 'CMD',
        action = wezterm.action.SplitHorizontal {
            domain = 'CurrentPaneDomain'
        }
    }, {
        key = 'd',
        mods = 'CMD|SHIFT',
        action = wezterm.action.SplitVertical {
            domain = 'CurrentPaneDomain'
        }
    }, -- Tab management
    {
        key = 't',
        mods = 'CMD',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain'
    }, -- Manual tab rename
    {
        key = 'r',
        mods = 'CMD|SHIFT',
        action = wezterm.action.PromptInputLine {
            description = 'Enter new name for tab (leave empty to use auto-naming):',
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    if line == '' then
                        window:active_tab():set_title('')
                    else
                        window:active_tab():set_title(line)
                    end
                end
            end)
        }
    }, -- Reset tab name to auto
    {
        key = 'r',
        mods = 'CMD|CTRL',
        action = wezterm.action_callback(function(window, pane)
            window:active_tab():set_title('')
        end)
    }, -- Clear scrollback (remapped from Cmd+K since we use K for movement)
    {
        key = 'k',
        mods = 'CMD|SHIFT',
        action = wezterm.action.ClearScrollback('ScrollbackAndViewport')
    }}

    -- Add number key bindings for direct tab access
    for i = 1, 8 do
        table.insert(config.keys, {
            key = tostring(i),
            mods = 'CMD',
            action = wezterm.action.ActivateTab(i - 1)
        })
    end
end

return module
