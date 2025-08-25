#!/bin/bash

# Script to change a macOS application's icon
# Usage: ./change_app_icon.sh <app_path> <icns_file>

set -e  # Exit on any error

usage_help() {
    echo "Usage: $0 <app_path> <icns_file>"
    echo ""
    echo "Arguments:"
    echo "  app_path    Path to the .app bundle (e.g., /Applications/MyApp.app)"
    echo "  icns_file   Path to the .icns icon file"
    echo ""
    echo "Examples:"
    echo "  $0 /Applications/Calculator.app my_icon.icns"
    echo "  $0 ~/Applications/MyApp.app ./custom_icon.icns"
    echo ""
    echo "Note: This script requires administrator privileges for system apps."
    exit 1
}

check_dependencies() {
    if ! command -v plutil &> /dev/null; then
        echo "Error: plutil command not found. This script requires macOS."
        exit 1
    fi
    
    if ! command -v touch &> /dev/null; then
        echo "Error: touch command not found."
        exit 1
    fi
}

backup_original_icon() {
    local app_path="$1"
    local resources_dir="$app_path/Contents/Resources"
    local backup_dir="$HOME/.app-icon-backups/$(basename "$app_path" .app)-$(date +%Y%m%d-%H%M%S)"
    
    echo "Creating backup of original icon..."
    mkdir -p "$backup_dir"
    
    # Find and backup existing icon files
    find "$resources_dir" -name "*.icns" -exec cp {} "$backup_dir/" \; 2>/dev/null || true
    
    # Also backup Info.plist for reference
    if [ -f "$app_path/Contents/Info.plist" ]; then
        cp "$app_path/Contents/Info.plist" "$backup_dir/"
    fi
    
    echo "✓ Backup saved to: $backup_dir"
    echo "$backup_dir" > "/tmp/last_icon_backup_path"
}

get_icon_filename() {
    local app_path="$1"
    local info_plist="$app_path/Contents/Info.plist"
    
    if [ -f "$info_plist" ]; then
        # Try to get icon filename from Info.plist
        local icon_file=$(plutil -extract CFBundleIconFile raw "$info_plist" 2>/dev/null || echo "")
        
        if [ -n "$icon_file" ]; then
            # Add .icns extension if not present
            if [[ "$icon_file" != *.icns ]]; then
                icon_file="${icon_file}.icns"
            fi
            echo "$icon_file"
            return 0
        fi
    fi
    
    # Fallback: look for existing .icns files in Resources
    local resources_dir="$app_path/Contents/Resources"
    if [ -d "$resources_dir" ]; then
        local existing_icon=$(find "$resources_dir" -name "*.icns" -type f | head -n 1)
        if [ -n "$existing_icon" ]; then
            basename "$existing_icon"
            return 0
        fi
    fi
    
    # Default fallback
    echo "app.icns"
}

refresh_icon_cache() {
    local app_path="$1"
    
    echo "Refreshing icon cache..."
    
    # Touch the app bundle to update modification time
    touch "$app_path"
    
    # Clear icon cache
    sudo rm -rf /Library/Caches/com.apple.iconservices.store 2>/dev/null || true
    rm -rf ~/Library/Caches/com.apple.iconservices.store 2>/dev/null || true
    
    # Restart Finder and Dock to refresh icons
    killall Finder 2>/dev/null || true
    killall Dock 2>/dev/null || true
    
    echo "✓ Icon cache refreshed"
}

# Check arguments
if [ $# -ne 2 ]; then
    usage_help
fi

APP_PATH="$1"
ICNS_FILE="$2"

# Validate inputs
if [ ! -d "$APP_PATH" ]; then
    echo "Error: App bundle '$APP_PATH' not found or is not a directory."
    exit 1
fi

if [ ! -f "$ICNS_FILE" ]; then
    echo "Error: Icon file '$ICNS_FILE' not found."
    exit 1
fi

if [[ "$APP_PATH" != *.app ]]; then
    echo "Error: '$APP_PATH' does not appear to be a .app bundle."
    exit 1
fi

# Check dependencies
check_dependencies

echo "==== Changing icon for '$(basename "$APP_PATH")'"
echo "New icon: $ICNS_FILE"

# Check if we need sudo for this app
RESOURCES_DIR="$APP_PATH/Contents/Resources"
if [ ! -w "$RESOURCES_DIR" ] 2>/dev/null; then
    echo "Note: This app requires administrator privileges to modify."
    echo "You may be prompted for your password."
    SUDO_CMD="sudo"
else
    SUDO_CMD=""
fi

# Create backup
backup_original_icon "$APP_PATH"

# Determine target icon filename
TARGET_ICON_NAME=$(get_icon_filename "$APP_PATH")
TARGET_ICON_PATH="$RESOURCES_DIR/$TARGET_ICON_NAME"

echo "Target icon path: $TARGET_ICON_PATH"

# Ensure Resources directory exists
$SUDO_CMD mkdir -p "$RESOURCES_DIR"

# Copy new icon
echo "Installing new icon..."
if ! $SUDO_CMD cp "$ICNS_FILE" "$TARGET_ICON_PATH"; then
    echo "Error: Failed to copy icon file. Check permissions."
    exit 1
fi

# Set proper permissions
$SUDO_CMD chmod 644 "$TARGET_ICON_PATH"

echo "✓ Icon file installed successfully"

# Refresh icon cache
refresh_icon_cache "$APP_PATH"

echo "✓ Icon changed successfully!"
echo ""
echo "If the new icon doesn't appear immediately, try:"
echo "  - Logging out and back in"
echo "  - Restarting your Mac"
echo ""
echo "To restore the original icon, use the backup at:"
cat "/tmp/last_icon_backup_path" 2>/dev/null || echo "  ~/.app-icon-backups/"
