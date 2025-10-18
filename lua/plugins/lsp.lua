return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    dependencies = {
        "hrsh7th/nvim-cmp",
        "j-hui/fidget.nvim",
    },
    init = function()
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
        vim.keymap.set('n', ']e', vim.diagnostic.goto_next)
        vim.keymap.set('n', '[e', vim.diagnostic.goto_prev)
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client == nil then
                    return
                end
                if client.name == 'ruff' then
                    -- Disable hover in favor of Pyright
                    client.server_capabilities.hoverProvider = false
                end
            end,
            desc = 'LSP: Disable hover capability from Ruff',
        })

        vim.lsp.config['clangd'] = require('lsp.clangd')
        vim.lsp.enable('clangd')

        vim.lsp.config['omnisharp'] = require('lsp.omnisharp')
        vim.lsp.enable('omnisharp')

        vim.lsp.config['pyright'] = require('lsp.pyright')
        vim.lsp.enable('pyright')

        vim.lsp.config['ruff'] = require('lsp.ruff')
        vim.lsp.enable('ruff')

        vim.lsp.config['rust_analyzer'] = require('lsp.rust_analyzer')
        vim.lsp.enable('rust_analyzer')
    end,
}
