# nvim-shared

Shared configuration modules for multiple nvim setups.

## Usage

Add to any nvim config's `init.lua`:

```lua
vim.opt.runtimepath:prepend(vim.fn.stdpath('config') .. '/../nvim-shared')

require('shared.options')
require('shared.keymaps')
```

## Modules

- `shared.options` - Core vim options (line numbers, indentation, search, clipboard, etc.)
- `shared.keymaps` - Core keymaps (movement, window/tab/buffer navigation, text objects)
- `shared.utils` - Helper functions (nmap_leader, xmap_leader)

