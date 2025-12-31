local wezterm = require('wezterm')

-- Plugin module
local ThemeSelector = {}

-- Internal state
local state = {
    themes = {}, -- List of available themes
    current_index = 1, -- Current theme index
    default_theme = nil -- Original theme from config
}

-----------------------------------------------------------
-- Core Functions
-----------------------------------------------------------

-- Build a sorted list of all available color schemes
local function build_theme_list()
    local schemes = wezterm.color.get_builtin_schemes()
    local themes = {}

    for name, _ in pairs(schemes) do
        table.insert(themes, name)
    end

    table.sort(themes)
    return themes
end

-- Find the index of a theme in the theme list
local function find_theme_index(theme_name)
    for i, name in ipairs(state.themes) do
        if name == theme_name then
            return i
        end
    end
    return 1 -- Default to first theme if not found
end

-- Change the color scheme and show notification
local function apply_theme(window, new_index, operation_name)
    state.current_index = new_index
    local theme_name = state.themes[state.current_index]

    window:set_config_overrides({
        color_scheme = theme_name
    })

    
   
    -- window:toast_notification('WezTerm Theme', operation_name .. ': ' .. theme_name, nil, 4000)
end

-----------------------------------------------------------
-- Theme Operations
-----------------------------------------------------------

-- Switch to the next theme
local function next_theme(window)
    local new_index = (state.current_index % #state.themes) + 1
    apply_theme(window, new_index, 'Next theme')
end

-- Switch to the previous theme
local function prev_theme(window)
    local new_index = state.current_index - 1
    if new_index < 1 then
        new_index = #state.themes
    end
    apply_theme(window, new_index, 'Previous theme')
end

-- Switch to a random theme
local function random_theme(window)
    -- Set random seed with integer value
    math.randomseed(os.time())

    -- Ensure we select a different theme than the current one
    local current_theme_index = state.current_index
    local new_index = current_theme_index

    -- Keep trying until we get a different theme
    while new_index == current_theme_index do
        new_index = math.random(1, #state.themes)
    end

    apply_theme(window, new_index, 'Random theme')
end

-- Switch back to the default theme
local function default_theme(window)
    -- Use the original theme from configuration
    if state.default_theme then
        local default_index = find_theme_index(state.default_theme)
        apply_theme(window, default_index, 'Default theme')
    else
        -- Fallback to first theme if default not set
        apply_theme(window, 1, 'First theme')
    end
end

-----------------------------------------------------------
-- Configuration
-----------------------------------------------------------

-- Configure key bindings based on options
local function default_key_bindings(options)
    local keys = {{
        key = 'n',
        mods = 'SUPER|SHIFT',
        action = wezterm.action_callback(function(window, pane)
            next_theme(window)
        end)
    }, {
        key = 'p',
        mods = 'SUPER|SHIFT',
        action = wezterm.action_callback(function(window, pane)
            prev_theme(window)
        end)
    }, {
        key = 'r',
        mods = 'SUPER|SHIFT',
        action = wezterm.action_callback(function(window, pane)
            random_theme(window)
        end)
    }, {
        key = 'd',
        mods = 'SUPER|SHIFT',
        action = wezterm.action_callback(function(window, pane)
            default_theme(window)
        end)
    }}
    return keys
end

-- Initialize theme state based on config
local function initialize_theme_state(config)
    -- Build theme list
    state.themes = build_theme_list()

    -- Save the original theme from config as default
    state.default_theme = config.color_scheme

    -- Set initial theme index
    if config.color_scheme then
        state.current_index = find_theme_index(config.color_scheme)
    else
        -- If no theme is set, use the first theme
        state.current_index = 1
        config.color_scheme = state.themes[state.current_index]
        -- Also save this as default
        state.default_theme = config.color_scheme
    end
end

-----------------------------------------------------------
-- Public API
-----------------------------------------------------------

-- Apply configuration to WezTerm
function ThemeSelector.apply_to_config(config, options)
    options = options or {}

    initialize_theme_state(config)
    -- Setup key bindings
    local default_keys = default_key_bindings(options)

    config.keys = config.keys or {}
    for _, key_entry in ipairs(default_keys) do
        table.insert(config.keys, key_entry)
    end

    return config
end

return ThemeSelector
