local nvim_shared = vim.fn.fnamemodify(vim.fn.stdpath('config') .. '/../nvim-shared', ':p'):gsub('/$', '')
vim.opt.runtimepath:prepend(nvim_shared)

_G.Config = {
    utils = require('shared.utils')
}

require('shared.options')
require('shared.keymaps')

require('options')
require('keymaps')

require('lazy-setup')
require('after-setup')
