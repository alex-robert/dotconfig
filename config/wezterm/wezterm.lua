-- -- Import Wezterm 
local wezterm = require 'wezterm'

-------------------------
--    Import modules   --
-------------------------
local default_conf = require 'default_config'
local default_keymaps = require 'default_keymaps'
local tabline_conf = require 'tabline_config'
local theme_selector = require "plugins/theme_selector"
local tabline_plugin = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

local workspace_resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

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

-- ## Apply modules configurations ##

-- Tabline Plugin
tabline_plugin.setup(tabline_conf)
tabline_plugin.apply_to_config(config)

-- Theme switcher plugin

theme_selector.apply_to_config(config, {
  next_theme_key = 'n',
  next_theme_mods = 'SUPER|SHIFT',
  prev_theme_key = 'p',
  prev_theme_mods = 'SUPER|SHIFT',
  default_theme_key = 'd',
  default_theme_mods = 'SUPER|SHIFT'
})

-- Resurect (sae sessions / workspaces)
workspace_resurrect.state_manager.change_state_save_dir(wezterm.config_dir .. "/workspaces/")

workspace_resurrect.state_manager.periodic_save({
  interval_seconds = 30,
  save_workspaces = true,
  save_windows = true,
  save_tabs = true,
})

local resurec_keymap = {
  {
    key = "w",
    mods = "ALT",
    action = wezterm.action_callback(function(win, pane)
        workspace_resurrect.state_manager.save_state(workspace_resurrect.workspace_state.get_workspace_state())
      end),
  }
}


add_keymaps(config, resurec_keymap)

-- Workspace Switcher

local workspace_switcher_keymap ={ {
    key = "s",
    mods = "LEADER",
    action = workspace_switcher.switch_workspace(),
  },
  {
    key = "S",
    mods = "LEADER",
    action = workspace_switcher.switch_to_prev_workspace(),
  }
}

add_keymaps(config, workspace_switcher_keymap)


workspace_switcher.apply_to_config(config)


-- Add custom key maping
-- add_keymap(config, { key = "S", mods = "ALT", action = wezterm.action_callback(function(window, pane) 
--   window:toast_notification('wezterm', 'alt-S hit', nil, 5000)
-- end )})

-------------------------
-- Events              --
-------------------------
wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
    -- resurrect.state_manager.resurrect_on_gui_startup()
end)

wezterm.on('window-config-reloaded', function(window)
  -- window:toast_notification('wezterm', 'configuration reloaded!', nil, 4000)
end)


return config
