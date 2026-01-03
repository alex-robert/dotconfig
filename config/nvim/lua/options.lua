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
opt.wrap = true
opt.linebreak = true
opt.cursorline = true
opt.cmdheight = 0
opt.fillchars = { eob = " " }

-- Whitespace visualization
opt.list = true
opt.listchars = {
  space = "·",
  tab = "→ ",
  trail = "•",
--  extends = "⟩",
--  precedes = "⟨",
--  nbsp = "␣",
}
opt.showbreak = "↪ "
-- Dim whitespace characters
vim.api.nvim_set_hl(0, "Whitespace", { fg = "#3a3a3a" })
vim.api.nvim_set_hl(0, "NonText", { fg = "#3a3a3a" })

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
