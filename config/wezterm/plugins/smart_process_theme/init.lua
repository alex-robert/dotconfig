local wezterm = require('wezterm')

-- Plugin module
local ProcessTheme = {}

-- Internal state
local state = {
  process_themes = {}, -- Map of process names to themes
  default_theme = nil, -- Original theme from config
  current_process_theme = nil, -- Currently active process-specific theme
}

-----------------------------------------------------------
-- Helper Functions
-----------------------------------------------------------

-- Extract the base name from an executable path
local function basename(path)
  if not path then
    return nil
  end
  return path:match("([^/\\]+)$") or path
end

-- Check if a process matches any configured process patterns
local function find_matching_theme(process_name)
  if not process_name then
    return nil
  end

  local base = basename(process_name)

  for pattern, theme in pairs(state.process_themes) do
    if base:find(pattern) then
      return theme
    end
  end

  return nil
end

-- Apply theme to window
local function apply_theme(window, theme_name)
  if not theme_name then
    return
  end

  local overrides = window:get_config_overrides() or {}

  if overrides.color_scheme ~= theme_name then
    overrides.color_scheme = theme_name
    window:set_config_overrides(overrides)
    state.current_process_theme = theme_name
  end
end

-- Restore default theme
local function restore_default_theme(window)
  if not state.default_theme then
    return
  end

  local overrides = window:get_config_overrides() or {}

  if overrides.color_scheme ~= state.default_theme then
    overrides.color_scheme = state.default_theme
    window:set_config_overrides(overrides)
    state.current_process_theme = nil
  end
end

-----------------------------------------------------------
-- Event Handler
-----------------------------------------------------------

-- Monitor process changes and update theme
local function on_update_status(window, pane)
  local active_pane = window:active_pane()

  if not active_pane then
    return
  end

  local process_info = active_pane:get_foreground_process_info()

  if not process_info then
    -- No process info available, restore default if needed
    if state.current_process_theme then
      restore_default_theme(window)
    end
    return
  end

  local matching_theme = find_matching_theme(process_info.executable)

  if matching_theme then
    -- Process matches a configured theme
    if state.current_process_theme ~= matching_theme then
      apply_theme(window, matching_theme)
    end
  else
    -- No matching theme, restore default if we had applied one
    if state.current_process_theme then
      restore_default_theme(window)
    end
  end
end

-----------------------------------------------------------
-- Public API
-----------------------------------------------------------

-- Apply configuration to WezTerm
function ProcessTheme.apply_to_config(config, options)
  options = options or {}

  -- Save default theme
  state.default_theme = config.color_scheme

  -- Configure process-to-theme mappings
  -- Format: { process_pattern = "theme_name" }
  state.process_themes = options.process_themes or {}

  -- Register event handler
  wezterm.on('update-status', on_update_status)

  return config
end

return ProcessTheme
