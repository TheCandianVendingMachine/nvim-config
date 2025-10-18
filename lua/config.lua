vim.filetype.add({
    extension = {
        wgsl = 'wgsl',
        frag = 'glsl',
        vert = 'glsl',
    },
})

vim.diagnostic.config({
    underline = true,
    severity_sort = true,
    update_in_insert = false,
    signs = true,
    virtual_lines = {
        current_line = true
    },
    virtual_text = {
        prefix = '-',
        current_line = false,
    },
    float = {
        border = 'rounded',
        header = '',
        scope = 'cursor'
    }
})

