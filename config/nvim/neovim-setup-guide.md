# Neovim Setup Guide with Custom Movement Keys

## 1. Installation

```bash
# Install Neovim via Homebrew
brew install neovim

# Install a Nerd Font for icons (optional but recommended)
brew install --cask font-jetbrains-mono-nerd-font
```

## 2. Basic Configuration Structure

Create the config directory:
```bash
mkdir -p ~/.config/nvim
cd ~/.config/nvim
```

Create these files:
- `init.lua` (main config file)
- `lua/keymaps.lua` (your custom keybindings)
- `lua/options.lua` (editor settings)
- `lua/plugins.lua` (plugin configuration)

## 3. Basic Configuration Files

### `~/.config/nvim/init.lua`
```lua
-- Load core configurations
require('options')
require('keymaps')
require('plugins')

-- Set colorscheme
vim.cmd.colorscheme('habamax') -- Built-in colorscheme, change later if desired
```

### `~/.config/nvim/lua/options.lua`
```lua
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.wrap = false
opt.cursorline = true

-- Behavior
opt.mouse = "a"
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.splitbelow = true
opt.splitright = true
opt.undofile = true
opt.swapfile = false

-- Performance
opt.updatetime = 300
opt.timeoutlen = 400
```

### `~/.config/nvim/lua/keymaps.lua`
```lua
local keymap = vim.keymap

-- Set leader key
vim.g.mapleader = " "

-- Custom Movement Keys (your preference: i,j,k,l)
-- Normal mode
keymap.set("n", "i", "h", { desc = "Move left" })
keymap.set("n", "j", "j", { desc = "Move down" }) -- j stays the same
keymap.set("n", "k", "k", { desc = "Move up" })   -- k stays the same  
keymap.set("n", "l", "l", { desc = "Move right" }) -- l stays the same

-- But we need to remap what 'i' normally does (insert mode)
keymap.set("n", "h", "i", { desc = "Enter insert mode" })
keymap.set("n", "H", "I", { desc = "Insert at beginning of line" })

-- Visual mode movement
keymap.set("v", "i", "h", { desc = "Move left" })
keymap.set("v", "j", "j", { desc = "Move down" })
keymap.set("v", "k", "k", { desc = "Move up" })
keymap.set("v", "l", "l", { desc = "Move right" })

-- Word movement with your custom keys
keymap.set("n", "I", "b", { desc = "Move word backward" })  -- Shift+i
keymap.set("n", "L", "w", { desc = "Move word forward" })   -- Shift+l

-- Window navigation (when you have splits)
keymap.set("n", "<leader>i", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<leader>j", "<C-w>j", { desc = "Go to bottom window" })
keymap.set("n", "<leader>k", "<C-w>k", { desc = "Go to top window" })
keymap.set("n", "<leader>l", "<C-w>l", { desc = "Go to right window" })

-- Essential shortcuts
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>x", ":x<CR>", { desc = "Save and quit" })

-- File explorer
keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })

-- Clear search highlighting
keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Move lines up/down
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
```

### `~/.config/nvim/lua/plugins.lua`
```lua
-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin specifications
require("lazy").setup({
  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    end,
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup()
      
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "javascript", "typescript", "python", "html", "css" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- Comment toggle
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
})
```

## 4. Installation Steps

1. Create the files above in the correct locations
2. Open Neovim: `nvim`
3. Plugins will auto-install on first run
4. Restart Neovim after installation completes

## 5. Basic Commands Cheat Sheet

### Your Custom Movement
- `i` = move left (instead of h)
- `j` = move down 
- `k` = move up
- `l` = move right
- `h` = enter insert mode (instead of i)
- `H` = insert at beginning of line

### Essential Commands
- `h` = enter insert mode (your remap)
- `v` = visual mode
- `V` = visual line mode
- `y` = copy (yank)
- `p` = paste
- `d` = delete/cut
- `u` = undo
- `<C-r>` = redo
- `:w` = save
- `:q` = quit
- `:wq` or `:x` = save and quit

### File Operations
- `<leader>e` = toggle file explorer
- `<leader>ff` = find files
- `<leader>fg` = search in files
- `<leader>fb` = switch between open files

### Text Editing
- `dd` = delete line
- `yy` = copy line  
- `cc` = change line
- `x` = delete character
- `r` = replace character
- `o` = new line below
- `O` = new line above

### Navigation
- `gg` = go to top
- `G` = go to bottom
- `0` = beginning of line
- `$` = end of line
- `I` = word backward (your remap)
- `L` = word forward (your remap)

## 6. Next Steps

Once comfortable with basics:
- Add LSP (Language Server Protocol) for code intelligence
- Configure specific language support
- Add more plugins as needed
- Customize colorscheme and appearance

## 7. Quick Start Workflow

1. Open terminal (WezTerm)
2. Navigate to your project: `cd ~/your-project`
3. Open Neovim: `nvim .`
4. Use `<leader>e` to toggle file explorer
5. Use `<leader>ff` to quickly find files
6. Navigate with `i,j,k,l`
7. Press `h` to start editing
8. Press `Esc` to return to normal mode
9. Save with `:w` or `<leader>w`

The configuration is minimal but functional. You can gradually add more plugins and features as you become more comfortable with Neovim.