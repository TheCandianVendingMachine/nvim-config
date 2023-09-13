local lsp = require 'lspconfig'

local lsp_flags = {
    debounce_text_changes = 150
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

lsp['tsserver'].setup {
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
}

lsp['pyright'].setup{
    flags = lsp_flags,
    capabilities = capabilities
}

lsp['rust_analyzer'].setup({})

require('rust-tools').setup({
    inlay_hints = {
        auto = true,
    }
})

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', ']e', vim.diagnostic.goto_next)
vim.keymap.set('n', '[e', vim.diagnostic.goto_prev)
