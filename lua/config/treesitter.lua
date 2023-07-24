local ts = require 'nvim-treesitter.configs'
ts.setup {
    ensure_installed = { "python", "rust", "lua", "html", "dockerfile" },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
    }
}

vim.keymap.set('n', '<space>', 'za')
