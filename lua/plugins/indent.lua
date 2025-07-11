return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    init = function()
        vim.opt.termguicolors = true
        vim.opt.list = true

        local highlight = {
            "RainbowRed",
            "RainbowBlue",
        }

        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        end)

    end,
    ---@module "ibl"
    ---@type ibl.config
    opts = {
        debounce = 100,
        indent = {
            highlight = highlight,
            char = "|"
        },
        whitespace = {
            highlight = {
                "Whitespace",
                "NonText"
            }
        },
        scope = {
            enabled = true
        }
    }
}
