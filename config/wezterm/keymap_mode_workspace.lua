local wezterm = require 'wezterm'
local resurrect = require 'plugins/resurrect'
local workspace_switcher = require 'plugins/sws'

return {
  {
    key = 'n',
    action = wezterm.action_callback(function(window, pane)
        local cwd_uri = pane:get_current_working_dir()
        local cwd = cwd_uri and cwd_uri.file_path
        local name = cwd and cwd:match('/([^/]+)/?$') or 'default'
        window:perform_action(wezterm.action.SwitchToWorkspace {
            name = name,
            spawn = {
                cwd = cwd
            }
        }, pane)
      end)
  }, 
  {
      key = 'n',
      mods= 'CTRL',
      action = wezterm.action.PromptInputLine {
          description = 'Enter workspace name:',
          action = wezterm.action_callback(function(window, pane, line)
              if line then
                  window:perform_action(wezterm.action.SwitchToWorkspace {
                      name = line
                  }, pane)
              end
          end)
      }
  },

{
    key = "s",
    action = wezterm.action_callback(function(win, pane)
        resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
      end),
  },
  {
    key = "r",
    action = wezterm.action.Multiple {
      wezterm.action_callback(function(win, pane)
      resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
        local type = string.match(id, "^([^/]+)") -- match before '/'
        id = string.match(id, "([^/]+)$") -- match after '/'
        id = string.match(id, "(.+)%..+$") -- remove file extention

        local opts = {
          spawn_in_workspace = true, -- if set to false, will restore in the current opened workspace (default)
          relative = true,
          restore_text = false,
          close_open_tabs =  true,
          close_open_panes = true,
          on_pane_restore = resurrect.tab_state.default_on_pane_restore,
        }

        if type == "workspace" then
          local state = resurrect.state_manager.load_state(id, "workspace")
          resurrect.workspace_state.restore_workspace(state, opts)
            win:perform_action(
              wezterm.action.SwitchToWorkspace({
                name = id,
              }), pane
            )

        end
      end, {
        title = "Load workspace: ",
        description = "Select a workspace to resurect and press Enter",
        fuzzy_description = "Select a workspace to resurect",
        is_fuzzy = false,
        ignore_windows = true,
        ignore_tabs = true,
        show_state_with_date = true,
        })
      end),
      'PopKeyTable',
    },
    
  },
  {
    key = "l",
    action = wezterm.action.Multiple {
      workspace_switcher.switch_workspace(),
      'PopKeyTable',
    }
  },
  {
    key = 'Escape',
    action = 'PopKeyTable'
  }
}
