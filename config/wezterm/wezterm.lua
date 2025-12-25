-- -- Import Wezterm 
local wezterm = require 'wezterm'

-------------------------
--    Import modules   --
-------------------------
local default_conf = require 'default_config'
local default_keymaps = require 'default_keymaps'
local tabline_conf = require 'tabline_config'
local theme_selector = require "plugins/theme_selector"

local tabline = require 'plugins/tabline'
local resurrect = require 'plugins/resurrect'
local workspace_switcher = require 'plugins/sws'

-------------------------
-- Utility function
-------------------------
local function config_apply(config, module)
    for k, v in pairs(module) do
        config[k] = v
    end
end

local function add_keymap(config, keymap)
  table.insert(config.keys, keymap)
end

local function add_keymaps(config, map)
  for i, key in pairs(map) do 
      table.insert(config.keys, key)
  end
end

local function add_mode(config, mod_name, keymap)
  config.key_tables[mod_name] = keymap
end

local function maximize_window(window)
    local screen = wezterm.gui.screens().main
    local gui_window = window:gui_window()
    gui_window:set_position(0, 0)
    gui_window:set_inner_size(screen.width, screen.height)
end

-------------------------
-- Setup config        --
-------------------------
local config = wezterm.config_builder and wezterm.config_builder() or {}

config_apply(config, default_conf)
config_apply(config, default_keymaps)

add_keymaps(config, {
  {
    key = 'r',
    mods = 'LEADER',
    action = wezterm.action.ActivateKeyTable {
        name = 'window_mode',
        one_shot = false
    }
  }, -- Enter workspace mode
  {
      key = 'w',
      mods = 'LEADER',
      action = wezterm.action.ActivateKeyTable {
          name = 'workspace_mode',
          one_shot = false
      }
  }
})

local window_mod_keys = require 'keymap_mode_window'
add_mode(config, 'window_mode', window_mod_keys)


-- ## Apply modules configurations ##
-- Tabline Plugin
tabline.setup(tabline_conf)
tabline.apply_to_config(config)

-- Theme switcher plugin

theme_selector.apply_to_config(config)

-- Resurect (sae sessions / workspaces)
resurrect.state_manager.change_state_save_dir(wezterm.config_dir .. "/workspaces/")

resurrect.state_manager.periodic_save({
  interval_seconds = 120,
  save_workspaces = true,
  save_windows = true,
  save_tabs = true,
})

local workspace_mod_keys = require 'keymap_mode_workspace'
add_mode(config, 'workspace_mode', workspace_mod_keys)

-- Workspace Switcher

local workspace_switcher_keymap ={ 
  {
    key = "s",
    mods = "CMD|SHIFT",
    action = workspace_switcher.switch_workspace(),
  },
}

add_keymaps(config, workspace_switcher_keymap)
workspace_switcher.apply_to_config(config)


-- loads the state whenever I create a new workspace
wezterm.on("smart_workspace_switcher.workspace_switcher.created", function(window, path, label)
  local workspace_state = resurrect.workspace_state

  workspace_state.restore_workspace(resurrect.state_manager.load_state(label, "workspace"), {
    window = window,
    relative = true,
    restore_text = true,
    on_pane_restore = resurrect.tab_state.default_on_pane_restore,
  })
end)

-- Saves the state whenever I select a workspace
wezterm.on("smart_workspace_switcher.workspace_switcher.selected", function(window, path, label)
  local workspace_state = resurrect.workspace_state
  resurrect.state_manager.save_state(workspace_state.get_workspace_state())
  resurrect.state_manager.write_current_state(label, "workspace")
end)




-- Add custom key maping
-- add_keymap(config, { key = "S", mods = "ALT", action = wezterm.action_callback(function(window, pane) 
--   window:toast_notification('wezterm', 'alt-S hit', nil, 5000)
-- end )})

-------------------------
-- Events              --
-------------------------
wezterm.on('gui-startup', resurrect.state_manager.resurrect_on_gui_startup)
wezterm.on('window-config-reloaded', function(window)
  -- window:toast_notification('wezterm', 'configuration reloaded!', nil, 4000)
end)


return config
