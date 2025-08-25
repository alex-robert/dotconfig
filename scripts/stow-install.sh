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

stow_git_hooks() {
    local hooks_source="$DOTCONFIG_DIR/scripts/git_hooks"
    local hooks_target="$DOTCONFIG_DIR/.git/hooks"
    
    echo "Installing git hooks..."
    
    # Check if .git/hooks directory exists
    if [ ! -d "$hooks_target" ]; then
        echo "Warning: .git/hooks directory not found at $hooks_target"
        return 1
    fi
    
    # Check if git_hooks source directory exists
    if [ ! -d "$hooks_source" ]; then
        echo "Warning: git_hooks source directory not found at $hooks_source"
        return 1
    fi
    
    # Create backup directory for existing hooks
    backup_dir="$HOME/.dotconfig-hooks-backup-$(date +%Y%m%d-%H%M%S)"
    
    # Install each hook file
    for hook_file in "$hooks_source"/*; do
        if [ -f "$hook_file" ]; then
            hook_name="$(basename "$hook_file")"
            target_hook="$hooks_target/$hook_name"
            
            # Backup existing hook if it exists and is not already a symlink to our file
            if [ -e "$target_hook" ] && [ ! -L "$target_hook" ]; then
                mkdir -p "$backup_dir"
                echo "Backing up existing hook: $hook_name"
                mv "$target_hook" "$backup_dir/$hook_name"
            elif [ -L "$target_hook" ] && [ "$(readlink "$target_hook")" != "$hook_file" ]; then
                mkdir -p "$backup_dir"
                echo "Backing up existing symlink: $hook_name"
                mv "$target_hook" "$backup_dir/$hook_name"
            fi
            
            # Create symlink
            ln -sf "$hook_file" "$target_hook"
            chmod +x "$target_hook"
            echo "✓ Installed git hook: $hook_name"
        fi
    done
    
    if [ -d "$backup_dir" ]; then
        echo "Git hook backups saved to: $backup_dir"
    fi
    
    echo "✓ Git hooks installed successfully"
}

# Install packages
stow_package "config" "$HOME/.config"
stow_package "home" "$HOME"
stow_git_hooks

echo "All packages installed!"
echo "To uninstall: stow -D -t ~/.config config && stow -D -t ~ home"
