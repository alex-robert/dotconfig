#!/bin/bash

DOTCONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$DOTCONFIG_DIR"

# Add all changes
git add .

# Commit with timestamp
if ! git diff --staged --quiet; then
    git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M:%S')"
    git push
    echo "✓ Changes synced successfully"
else
    echo "No changes to sync"
fi
