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

-- vim.api.nvim_create_autocmd("ColorScheme", {
--   pattern = "*",
--   -- callback = function()
--   --   vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#00cc66", bg = "NONE" })
--   --   vim.api.nvim_set_hl(0, "LineNr", { fg = "#888888" , bg = ""})
--   --   vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#aaaaaa", bold = true })
--   --   vim.api.nvim_set_hl(0, "SignColumn", { bg = "#e4e4e4" })
--   --   vim.api.nvim_set_hl(0, "FoldColumn", { fg = "#888888" })
--   -- end
-- })

-- Behavior
opt.mouse = "a"
vim.opt.selectmode = ""



opt.clipboard = "unnamedplus" -- Use system clipboard
opt.splitbelow = true
opt.splitright = true
opt.undofile = true
opt.swapfile = false

opt.foldmethod = "syntax"
opt.foldenable = false
opt.foldminlines = 20
opt.foldcolumn = "auto"

-- Performance
opt.updatetime = 300
opt.timeoutlen = 400

-- Session
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

