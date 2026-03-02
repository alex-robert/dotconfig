#!/bin/bash

STATE_FILE="/tmp/aerospace_display_state.txt"
BORDERS_CMD="/opt/homebrew/bin/borders"
LOG_FILE="/tmp/monitor-displays.log"

log() {
  echo "[borders-manager] $1" >> "$LOG_FILE"
}

pkill -9 borders 2>/dev/null
sleep 0.5

state=$(cat "$STATE_FILE" 2>/dev/null)
log "Aerospace reloaded - state: ${state:-unknown}"

if [[ "$state" == "multi" ]]; then
  log "Starting borders"
  "$BORDERS_CMD" active_color=0xffffd381 inactive_color=0xff494d64 width=4.0 >> "$LOG_FILE" 2>&1 &
else
  log "Single screen - borders not started"
fi
