#!/bin/zsh

export PATH="/opt/homebrew/bin:$PATH"

SHEET="$1"
CONTENT=$(cheat "$SHEET" 2>/dev/null)
CSS_FILE="$HOME/.config/swiftbar/styles/cheat.css"
TEMP_HTML="/tmp/cheat-${SHEET}.html"

echo "$CONTENT" | pandoc -f markdown -t html --standalone \
    --metadata title="$SHEET Keybindings" \
    --css="$CSS_FILE" > "$TEMP_HTML"

open "$TEMP_HTML"
