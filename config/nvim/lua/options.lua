local opt = vim.opt

opt.relativenumber = false
opt.number = true

opt.signcolumn = "yes"
opt.cursorline = true
opt.cmdheight = 0
opt.fillchars = { eob = " " }

opt.list = true
opt.listchars = {
  space = "·",
  tab = "→ ",
  trail = "•",
}
opt.showbreak = "↪ "

vim.api.nvim_set_hl(0, "Whitespace", { fg = "#3a3a3a" })
vim.api.nvim_set_hl(0, "NonText", { fg = "#3a3a3a" })

opt.foldmethod = "syntax"
opt.foldenable = false
opt.foldminlines = 20
opt.foldcolumn = "auto"

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
