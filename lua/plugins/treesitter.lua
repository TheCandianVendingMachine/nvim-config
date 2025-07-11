return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    config = function (lazy, opts)
        local configs = require("nvim-treesitter.configs")
        configs.setup(opts)
    end,
    opts = {
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
        }
    },
    init = function()
        vim.keymap.set('n', '<A-d>', 'za')
    end
}
