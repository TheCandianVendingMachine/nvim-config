return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    opts = {
        ensure_installed = {
            'maintained',
            'python',
            'html',
            'css',
            'json',
            'yaml',
            'csv',
            'rust',
            'toml',
            'lua',
            'make',
            'c',
            'c_sharp',
            'cpp'
        },
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
