local lsp = require 'lspconfig'
vim.lsp.handlers["wgsl-analyzer/requestConfiguration"] = function(err, result, ctx, config)
    return { 
        success = true,
        customImports = { _dummy_ = "dummy"},
        shaderDefs = {},
        trace = {
            extension = false,
            server = false,
        },
        inlayHints = {
            enabled = false,
            typeHints = false,
            parameterHints = false,
            structLayoutHints = false,
            typeVerbosity = "inner",
        },
        diagnostics = {
            typeErrors = true,
            nagaParsingErrors = true,
            nagaValidationErrors = true,
            nagaVersion = "main",
        }
    }
end

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
lsp['wgsl_analyzer'].setup({
    settings = {
        ['wgsl_analyzer'] = {
            diagnostics = {
                typeErrors = true,
                nagaParsingErrors = true,
                nagaValidationErrors = true,
            }
        }
    }
})

require('rust-tools').setup({
    inlay_hints = {
        auto = true,
    }
})

lsp['clangd'].setup({})

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', ']e', vim.diagnostic.goto_next)
vim.keymap.set('n', '[e', vim.diagnostic.goto_prev)
