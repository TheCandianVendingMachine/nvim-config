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
    end,
    config = function(lazy, opts)
        lsp = require('lspconfig')
        lsp.pyright.setup(opts.servers.pyright)
        lsp.ruff.setup(opts.servers.ruff)
        lsp.rust_analyzer.setup(opts.servers.rust_analyzer)
        lsp.clangd.setup(opts.servers.clangd)
        lsp.omnisharp.setup(opts.servers.omnisharp)
    end,
    opts = {
        servers = {
            ruff = {},
            pyright = {
                settings = {
                    pyright = {
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            ignore = { '*' },
                            typeCheckingMode = 'standard',
                            diagnosticMode = 'workspace'
                        },
                    }
                }
            },
            rust_analyzer = {},
            clangd = {
                cmd = { "clangd", "--clang-tidy" }
            },
            omnisharp = {
                cmd = { "dotnet", "/home/bailey/software/omnisharp/dotnet/OmniSharp.dll" },
                enable_editorconfig_support = true,
                enable_ms_build_load_projects_on_demand = false,
                organize_imports_on_format = true,
                enable_import_completion = true,
                analyze_open_documents_only = false,
                -- root_dir = lsp.util.root_pattern("*.csproj","*.sln")
            }
        },
    }
}
