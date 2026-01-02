local wezterm = require 'wezterm'

local super_vim_map = {
    -- CMD + s: save file
  s = utf8.char(0xAA),
    -- CMD + e: scroll downwords (ctrl + e analog)
  -- e = utf8.char(0xAB),
  --   -- CMD + y: scroll upwords (ctrl + y analog)
  -- y = utf8.char(0xAC),
  --   -- CMD + h: go to prev tab
  -- h = utf8.char(0xAD),
  --   -- CMD + l: go to next tab
  -- l = utf8.char(0xAE),
  --   -- CMD + w: close current tab
  -- w = utf8.char(0xAF),
  --   -- CMD + t: find file toogle (NvimTree)
  -- t = utf8.char(0xA1),
  --   -- CMD + [: open trouble window
  -- ['['] = utf8.char(0xA2),
  --   -- CMD + ]: close trouble window 
  -- [']'] = utf8.char(0xA3),

  --   -- CMD + n: copilot last
  -- n = utf8.char(0xA4),
  --   -- CMD + m: copilot next 
  -- m = utf8.char(0xA5),

  -- CMD + 1: open left bar like jb IDE
  -- ['1'] = utf8.char(0xA6)
}

local function is_vim(pane)
  local is_vim_env = pane:get_user_vars().IS_NVIM == 'true'
  if is_vim_env == true then return true end


  wezterm.log_info('Process name ' .. pane:get_foreground_process_name())

  local process_name = string.gsub(pane:get_foreground_process_name(), '(.*[/\\])(.*)', '%2')
  return process_name == 'nvim' or process_name == 'vim'
end


local function bind_cmd_to_vim(key)
  return {
    key = key,
    mods = 'CMD',
    action = wezterm.action_callback(function(win, pane)
      local char = super_vim_map[key]
      if char and is_vim(pane) then
        wezterm.log_info(key .. ' considered vim')
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = char, mods = nil },
        }, pane)
      else
        wezterm.log_info(key .. ' is NOT vim, expect normal behavior')

        win:perform_action({
          SendKey = {
            key = key,
            mods = 'CMD'
          }
        }, pane)
      end
    end)
  }
end


local function bind_vim_keys(map)
  local keymap = {}
  for key, char in pairs(map) do
    table.insert(keymap, bind_cmd_to_vim(key))
  end
  wezterm.log_info(keymap)
  return keymap
end


return bind_vim_keys(super_vim_map)
