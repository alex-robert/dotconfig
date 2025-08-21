#!/usr/bin/env bash

# Get the wezterm binary path
WEZTERM_BIN=$(which wezterm)
CONFIG_FILE="$HOME/.wezterm.lua"

schemes=$(cat <<EOF
Builtin Dark
Builtin Light
Builtin Pastel Dark
Builtin Solarized Dark
Builtin Solarized Light
Builtin Tango Dark
Builtin Tango Light
Dracula
Dracula (base16)
Dracula (Gogh)
Dracula (Official)
Dracula+
duckbones
Hopscotch
Hopscotch (base16)
Hopscotch.256
Horizon Bright (Gogh)
summercamp (base16)
Summerfruit Dark (base16)
Summerfruit Light (base16)
Sundried
Sundried (Gogh)
Wombat
Wombat (Gogh)
Woodland (base16)
Wryan
Wryan (Gogh)
Apprentice (Gogh)
arcoiris
Argonaut
Argonaut (Gogh)
Arthur
Arthur (Gogh)
EOF
)

chosen=$(echo "$schemes" | sort | fzf --height 50% --border --prompt=" Pick WezTerm theme: ")

if [ -n "$chosen" ]; then
  if grep -q "color_scheme" "$CONFIG_FILE"; then
    sed -i.bak "s/^\(\s*color_scheme\s*=\s*\).*$/\1\"$chosen\",/" "$CONFIG_FILE"
  else
    echo "color_scheme = \"$chosen\"," >> "$CONFIG_FILE"
  fi

  echo "Reloading WezTerm configuration [$CONFIG_FILE]..."
  echo "Color scheme set to: $chosen"
fi
