return {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },
    opts = function()
        cmp = require('cmp')
        return {
            window = {
                documentation = cmp.config.window.bordered(),
                completion = cmp.config.window.bordered({
                    winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None'
                })
            },
            formatting = {
                mode = 'text',
                maxwidth = 50,
                ellipsis_char = '..'
            },
            snippet = {
                expand = function(args)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-n>'] = cmp.mapping.scroll_docs(4),
                ['<C-space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<Cr>'] = cmp.mapping.confirm{
                    select = true,
                    behavior = cmp.ConfirmBehavior.Replace
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, {'i', 's'}),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, {'i', 's'})
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'crates' },
            }),
        }
    end
}
