local lsp = require 'lspconfig'

local lsp_flags = {
    debounce_text_changes = 150
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lsp['pyright'].setup{
    flags = lsp_flags,
    capabilities = capabilities
}
