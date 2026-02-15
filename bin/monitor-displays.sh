#!/bin/bash

# Display monitoring script - toggles borders and aerospace gaps based on connected displays
# Run via launchd agent for continuous monitoring

STATE_FILE="/tmp/aerospace_display_state.txt"
AEROSPACE_CONFIG="/Users/alex/Workspace/dotconfig/config/aerospace/aerospace.toml"
BORDERS_CMD="/opt/homebrew/bin/borders"

# Gap configuration (in pixels)
SINGLE_SCREEN_GAP=-2
MULTI_SCREEN_GAP=4

# Test mode override
FORCE_MODE=""

show_help() {
  cat << 'EOF'
Display monitor script - auto-toggle borders and aerospace gaps

Usage: monitor-displays.sh [OPTIONS]

Options:
  --single      Simulate single-screen setup (for testing)
  --multi       Simulate multi-screen setup (for testing)
  --help        Show this help message

Examples:
  ./monitor-displays.sh          # Auto-detect displays
  ./monitor-displays.sh --single # Test single-screen config
  ./monitor-displays.sh --multi  # Test multi-screen config
EOF
}

get_external_display_count() {
  system_profiler SPDisplaysDataType 2>/dev/null | grep -c "^[[:space:]]*Resolution:" | grep -v "Built-in"
}

get_total_displays() {
  system_profiler SPDisplaysDataType 2>/dev/null | grep -c "^[[:space:]]*Resolution:"
}

is_single_screen() {
  if [[ -n "$FORCE_MODE" ]]; then
    [[ "$FORCE_MODE" == "single" ]]
  else
    local total=$(get_total_displays)
    [[ $total -eq 1 ]]
  fi
}

stop_borders() {
  if pgrep -f "borders" > /dev/null; then
    pkill -9 borders 2>/dev/null
    sleep 0.5
    # Make sure it's really dead
    pkill -9 -f "/opt/homebrew/opt/borders/bin/borders" 2>/dev/null
    sleep 1
  fi
}

start_borders() {
  if ! pgrep -f "/opt/homebrew/opt/borders/bin/borders" > /dev/null; then
    "$BORDERS_CMD" active_color=0xffe1ede4 inactive_color=0xff494d64 width=10.0 > /dev/null 2>&1 &
    sleep 1
  fi
}

update_gaps() {
  local gap_size=$1
  local tmp_file="${AEROSPACE_CONFIG}.tmp"

  while IFS= read -r line; do
    if [[ $line =~ ^outer\.top[[:space:]]+ ]]; then
      echo "outer.top        = $gap_size"
    elif [[ $line =~ ^outer\.right[[:space:]]+ ]]; then
      echo "outer.right      = $gap_size"
    elif [[ $line =~ ^outer\.bottom[[:space:]]+ ]]; then
      echo "outer.bottom     = $gap_size"
    elif [[ $line =~ ^outer\.left[[:space:]]+ ]]; then
      echo "outer.left       = $gap_size"
    else
      echo "$line"
    fi
  done < "$AEROSPACE_CONFIG" > "$tmp_file"

  mv "$tmp_file" "$AEROSPACE_CONFIG"
}

reload_aerospace() {
  if command -v aerospace > /dev/null; then
    aerospace reload-config
  fi
}

main() {
  # Parse arguments
  case "${1:-}" in
    --single)
      FORCE_MODE="single"
      echo "TEST MODE: Simulating single-screen setup"
      ;;
    --multi)
      FORCE_MODE="multi"
      echo "TEST MODE: Simulating multi-screen setup"
      ;;
    --help|-h)
      show_help
      exit 0
      ;;
    "")
      # Normal operation
      ;;
    *)
      echo "Unknown option: $1"
      show_help
      exit 1
      ;;
  esac

  local current_state=""

  if [[ -f "$STATE_FILE" ]]; then
    current_state=$(<"$STATE_FILE")
  fi

  local new_state
  if is_single_screen; then
    new_state="single"
  else
    new_state="multi"
  fi

  if [[ "$current_state" != "$new_state" ]]; then
    echo "Display state changed: $current_state → $new_state"

    if [[ "$new_state" == "single" ]]; then
      echo "Single screen detected - disabling borders and removing gaps"
      stop_borders
      update_gaps "$SINGLE_SCREEN_GAP"
      reload_aerospace
    else
      echo "Multi-screen setup detected - enabling borders and adding gaps"
      start_borders
      update_gaps "$MULTI_SCREEN_GAP"
      reload_aerospace
    fi

    echo "$new_state" > "$STATE_FILE"
  fi
}

main "$@"
