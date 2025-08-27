local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = false

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
