local ts = require 'nvim-treesitter.configs'
ts.setup {
    ensure_installed = { "python", "dockerfile" },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
    }
}
