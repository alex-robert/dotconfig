local opt = vim.opt


opt.termguicolors = true
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


opt.wrap = true
opt.linebreak = true
opt.breakindent = false

opt.sidescroll = 0
opt.showbreak = "↪ "

opt.sidescrolloff = 8
opt.scrolloff = 8


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


opt.foldmethod = "syntax"
opt.foldenable = false
opt.foldminlines = 20
opt.foldcolumn = "auto"

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
