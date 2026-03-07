local opt = vim.opt

opt.showtabline = 0

opt.number = true
opt.relativenumber = false

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true
opt.wrap = true
opt.linebreak = true

opt.mouse = "a"
opt.selectmode = ""

opt.clipboard = "unnamedplus"
opt.splitbelow = true
opt.splitright = true
opt.undofile = true
opt.swapfile = false

opt.updatetime = 300
opt.timeoutlen = 400

opt.shortmess:append("I")

opt.scrolloff = 8

opt.signcolumn = "yes"
opt.cursorline = true
opt.cmdheight = 0

opt.fillchars = {
  eob = "~",
  vert = "▌",
  horiz = "▃",
  vertright = '▌',
  horizup = "▃",
  horizdown = "▃",
  vertleft = '▌',
  verthoriz = '█',
}

--   vert = '│',
--   horiz = '─',
--   horizup = '┴',
--   horizdown = '┬',
--   vertleft = '┤',
--   vertright = '├',
--   verthoriz = '┼',

opt.list = true

opt.listchars = {
  space = "·",
  tab = "→ ",
  trail = "·",
}

opt.showbreak = "↪ "

-- vim.api.nvim_set_hl(0, "Whitespace", { fg = "#3a3a3a" })
-- vim.api.nvim_set_hl(0, "NonText", { fg = "#3a3a3a" })

opt.foldmethod = "syntax"
opt.foldenable = false
opt.foldminlines = 20
opt.foldcolumn = "auto"

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
