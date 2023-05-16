require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true
})

vim.cmd.colorscheme "catppuccin"

local colors = require("catppuccin.palettes").get_palette()
require("catppuccin.lib.highlighter").syntax {
	FloatBorder = { fg = colors.overlay2, bg = colors.mantle },
}
