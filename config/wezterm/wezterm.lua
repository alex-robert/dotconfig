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
local spt = require 'plugins/smart_process_theme'

-------------------------
-- Utility function
-------------------------
local function config_apply(config, module)
    for k, v in pairs(module) do
        config[k] = v
    end
end

local function add_keymaps(config, map)
  for i, key in pairs(map) do
      table.insert(config.keys, key)
  end
end

local function add_mode(config, mod_name, keymap)
  config.key_tables[mod_name] = keymap
end

-------------------------
-- Setup config        --
-------------------------
local config = wezterm.config_builder and wezterm.config_builder() or {}

config_apply(config, default_conf)
config_apply(config, default_keymaps)

add_keymaps(config, {
  {
      key = 'w',
      mods = 'LEADER',
      action = wezterm.action.ActivateKeyTable {
          name = 'workspace_mode',
          one_shot = false
      }
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action.ActivateKeyTable {
      name = 'layout_mode',
      one_shot = false
    }
  },{
    key = 't',
    mods = 'LEADER',
    action = wezterm.action.ActivateKeyTable {
      name = 'theme_mode',
      one_shot = false
    }
  }
})

local workspace_mod_keys = require 'keymap_mode_workspace'
add_mode(config, 'workspace_mode', workspace_mod_keys)

local layout_mod_keys = require 'keymap_mode_layout'
add_mode(config, 'layout_mode', layout_mod_keys)



-- ## Apply modules configurations ##
-- Tabline Plugin
tabline.setup(tabline_conf)
tabline.apply_to_config(config)

-- Theme switcher plugin
theme_selector.apply_to_config(config, {keys = {}})
local function theme_action(fn)
    return wezterm.action_callback(function(window, pane)
        wezterm.GLOBAL.reactivate_theme_mode = true
        fn(window)
    end)
end

add_mode(config, 'theme_mode', {
    {
        key = 'n',
        mods = 'SHIFT',
        action = theme_action(theme_selector.apply_next_theme),
    }, {
        key = 'p',
        mods = 'SHIFT',
        action = theme_action(theme_selector.apply_previous_theme),
    },{
        key = 'r',
        mods = 'SHIFT',
        action = theme_action(theme_selector.reset_theme),
    },{
        key = 'Escape',
        action = 'PopKeyTable',
    }
})

-- Smart Process theme plugin
-- spt.apply_to_config(config, {
--   process_themes = {
--     claude = "SynthwaveAlpha",
--     copilot = "SynthwaveAlpha",
--     nvim = "PaleNightHC",
--   }
-- })

-- Resurect (sae sessions / workspaces)
resurrect.state_manager.change_state_save_dir(wezterm.config_dir .. "/workspaces/")

resurrect.state_manager.periodic_save({
  interval_seconds = 60,
  save_workspaces = true,
  save_windows = true,
  save_tabs = true,
})


-- Workspace Switcher
local workspace_switcher_keymap ={
  {
    key = "s",
    mods = "CMD|SHIFT",
    action = workspace_switcher.switch_workspace({
      extra_args = "| grep Workspace/"
    }),
  },
  {
    key = "z",
    mods = "CMD|SHIFT",
    action = workspace_switcher.switch_to_prev_workspace(),
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


-------------------------
-- Events              --
-------------------------

wezterm.on('gui-startup', function(cmd)
    local args = cmd or {}
-- #resurrect.state_manager.resurrect_on_gui_startup
end)

wezterm.on('window-config-reloaded', function(window, pane)
    if wezterm.GLOBAL.reactivate_theme_mode then
        wezterm.GLOBAL.reactivate_theme_mode = false
        wezterm.time.call_after(0.02, function()
            window:perform_action(
                wezterm.action.ActivateKeyTable {
                    name = 'theme_mode',
                    one_shot = false,
                },
                pane
            )
        end)
    end
end)


wezterm.on("update-status", function(window, _)

end)

return config
