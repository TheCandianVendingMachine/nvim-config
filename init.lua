-- Inspired by https://github.com/jdhao/nvim-config
require('plugins')

local core_conf_files = {
    "globals.vim",      -- some global settings
    "options.vim",      -- nvim setting options
    "autocommands.vim", -- various autocommands
    "mappings.vim",     -- all the user-defined mappings
    "plugins.vim",      -- all the plugins installed and their configuration
    "gfx.lua",          -- graphics / colorscheme settings
}

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

for _, name in ipairs(core_conf_files) do
    local path = string.format("%s/core/%s", vim.fn.stdpath('config'), name)
    local source_cmd = "source " .. path
    vim.cmd(source_cmd)
end
