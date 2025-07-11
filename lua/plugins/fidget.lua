return {
    'j-hui/fidget.nvim',
    opts = {
        progress = {
            display = {
                overrides = {
                    rust_analyzer = { name = 'rust_analyzer' }
                }
            }
        },
        notification = {
            window = {
                winblend = 30
            }
        }
    },
}
