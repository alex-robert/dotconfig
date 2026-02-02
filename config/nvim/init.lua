vim.opt.runtimepath:prepend(vim.fn.stdpath('config') .. '/../nvim-shared')

_G.Config = {
    utils = require('shared.utils')
}

require('shared.options')
require('shared.keymaps')

require('options')
require('keymaps')

require('lazy-setup')
require('after-setup')
