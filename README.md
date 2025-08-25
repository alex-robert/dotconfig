## Adding new configs:

```bash
# Move actual config to dotconfig
mv ~/.config/newapp ~/dotconfig/config/

# Re-stow (this will add the new symlink)
cd ~/dotconfig
stow -R -t ~/.config config
```

## Makefile 

```Makefile
.PHONY: install uninstall restow sync

install:
	@./scripts/stow-install.sh

uninstall:
	stow -D -t ~/.config config
	stow -D -t ~ home

restow:
	stow -R -t ~/.config config
	stow -R -t ~ home

sync:
	@./scripts/sync.sh

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
