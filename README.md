## Adding new configs:

```bash
# Move new app config to dotconfig
mv ~/.config/newapp ~/path/to/dotconfigdir/config/
make restow 
```

## Workflow

```bash
make install    # Initial setup
make restow     # Re-link everything (useful after adding new configs)
make sync       # Git sync
make uninstall  # Remove all symlinks
```
