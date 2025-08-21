#!/bin/bash

DOTCONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DOTCONFIG_DIR"

# Function to safely stow packages
stow_package() {
    local package="$1"
    local target="$2"
    
    echo "Installing $package to $target..."
    
    # Check for conflicts and backup if needed
    if stow -n -t "$target" "$package" 2>&1 | grep -q "existing target"; then
        echo "Found existing files, creating backups..."
        
        # Create backup directory
        backup_dir="$HOME/.dotconfig-backup-$(date +%Y%m%d-%H%M%S)"
        mkdir -p "$backup_dir"
        
        # Move conflicting files to backup
        stow -n -t "$target" "$package" 2>&1 | grep "existing target" | \
        sed 's/.*existing target is neither a link nor a directory: //' | \
        while read -r file; do
            if [ -f "$file" ] || [ -d "$file" ]; then
                echo "Backing up $file"
                mkdir -p "$backup_dir/$(dirname "$file")"
                mv "$file" "$backup_dir/$file"
            fi
        done
        
        echo "Backups saved to: $backup_dir"
    fi
    
    # Perform the stow operation
    stow -t "$target" "$package"
    echo "✓ $package installed successfully"
}

# Install packages
stow_package "config" "$HOME/.config"
stow_package "home" "$HOME"

echo "All packages installed!"
echo "To uninstall: stow -D -t ~/.config config && stow -D -t ~ home"
