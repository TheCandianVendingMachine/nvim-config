return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    init = function()
        vim.cmd.colorscheme "catppuccin"
        local colors = require("catppuccin.palettes").get_palette()
        require("catppuccin.lib.highlighter").syntax {
            FloatBorder = { fg = colors.overlay2, bg = colors.mantle },
        }
    end,
    opts = {
        flavour = "mocha",
        transparent_background = true
    }
}

