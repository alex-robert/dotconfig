-- Define config table to be able to pass data between scripts
_G.Config = {
    utils = {
        nmap_leader = function(suffix, rhs, desc)
            vim.keymap.set('n', '<Leader>' .. suffix, rhs, {
                desc = desc
            })
        end,

        xmap_leader = function(suffix, rhs, desc)
            vim.keymap.set('x', '<Leader>' .. suffix, rhs, {
                desc = desc
            })
        end
    }
}

require('options')
require('keymaps')

require('configs.lazy')
-- require('configs.mini')
require('configs.after')
