#!/bin/zsh

export PATH="/opt/homebrew/bin:$PATH"

SHEET="$1"
CONTENT=$(cheat "$SHEET" 2>/dev/null)
CSS_FILE="$HOME/.config/swiftbar/styles/cheat.css"

echo "$CONTENT" | pandoc -f markdown -t html --standalone \
    --metadata title="$SHEET Keybindings" \
    --css="$CSS_FILE"
