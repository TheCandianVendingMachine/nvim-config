local ts = require 'nvim-treesitter.configs'
ts.setup {
    ensure_installed = { "python", "typescript", "rust", "c", "lua", "html", "dockerfile", "markdown" },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
    }
}

vim.keymap.set('n', '<space>', 'za')
