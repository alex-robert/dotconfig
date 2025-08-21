## Adding new configs:

```bash
# Move actual config to dotconfig
mv ~/.config/newapp ~/dotconfig/config/

# Re-stow (this will add the new symlink)
cd ~/dotconfig
stow -R -t ~/.config config
```

## Workflow


# Just sync - files are already linked

```bash

~/dotconfig/scripts/sync.sh

## OR

make install    # Initial setup
make restow     # Re-link everything (useful after adding new configs)
make sync       # Git sync
make uninstall  # Remove all symlinks
```
