local wezterm = require('wezterm')
local tabline = require 'plugins/tabline'

wezterm.on('update-status', function(window, pane)
  if window:leader_is_active() then
    wezterm.emit('leader-state-is-active', window, pane, is_active)
  else
    wezterm.emit('leader-state-is-over', window, pane, is_active)
  end
end)


return{
  'is_leader_mode',
  events = {
    show = 'leader-state-is-active',
    hide = 'leader-state-is-over',
  },
  sections = {
    tabline_a = {
       ' ' .. wezterm.nerdfonts.md_keyboard_space .. ' LEADER ',
    }
  },
  theme = {
    a = {
      bg = '#2daf3cff'
    }
  }
}
