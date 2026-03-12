# CLAUDE.md

- Personal configuration files for macOS, managed with GNU Stow.

## Session Workflow
- Skip "Plan Task" part - this project don't use worktrees.

## Ask first, search after
- You always need a doc or a source base, I can usually provide it
- Never create Readme or documentation unless explicitly asked for

## How it works
- `config/` is stowed to `~/.config/` — each subdirectory is one app's config
- `home/` is stowed to `~/` — for dotfiles like `.zshrc`, `.gitconfig`
- `make install` / `make restow` / `make uninstall` manage symlinks via stow
- `make sync` runs git sync via `scripts/sync.sh`

## Adding a new app config
```bash
mv ~/.config/newapp ~/Workspace/dotconfig/config/
make restow
```
