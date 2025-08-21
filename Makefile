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
