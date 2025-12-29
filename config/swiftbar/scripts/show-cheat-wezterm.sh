#!/bin/zsh

export PATH="/opt/homebrew/bin:$PATH"

SHEET="$1"

wezterm --config-file $HOME/.config/wezterm/window-floating.lua\
    start \
    --class floating-cheat \
    -- zsh -c "
      source $HOME/.config/zsh/.zshrc
      clear
      cheat $SHEET | glow -p
" &

sleep 0.2

# brings to front
osascript -e 'tell application "WezTerm" to activate'
