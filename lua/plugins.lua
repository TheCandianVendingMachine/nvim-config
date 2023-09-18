vim.cmd [[packadd packer.nvim]]

local utils = require("utils")
return require('packer').startup(function(use)
    -- It is recommended to put impatient.nvim before any other plugins
    use { "lewis6991/impatient.nvim", config = [[require("impatient")]] }
    use { "wbthomason/packer.nvim", opt = true }

    use { "catppuccin/nvim", as = "catppuccin", config = [[require("config.catppuccin")]] }

    use { "onsails/lspkind-nvim", event = "VimEnter" }
    -- Auto-complete engine
    use { "hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require("config.nvim-cmp")]] }

    -- nvim-cmp completion sources
    use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
    use { "hrsh7th/cmp-path", after = "nvim-cmp" }
    use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
    use { "hrsh7th/cmp-omni", after = "nvim-cmp" }

    -- nvim-lsp configuration (relies on cmp-nvim-lsp)
    use { "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require("config.lsp")]] }

    use { "simrat39/rust-tools.nvim", event = "VimEnter", ft = { "rust" } }
    use {
        'saecki/crates.nvim', requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    }
    -- Treesitter parser
    use { "nvim-treesitter/nvim-treesitter", event = "BufEnter", run = ":TSUpdate", config = [[require("config.treesitter")]] }

    use { "kyazdani42/nvim-web-devicons", event = "VimEnter" }

    use { "nvim-lualine/lualine.nvim", event = "VimEnter", config = [[require("config.statusline")]] }

    use { "tpope/vim-commentary", event = "VimEnter" }
    use { "tpope/vim-surround", event = "VimEnter" }
    use { "justinmk/vim-sneak", event = "VimEnter" }

    use { "sbdchd/neoformat", cmd = { "Neoformat" } }

    use { "lukas-reineke/indent-blankline.nvim", event = "VimEnter", config = [[require("config.indent")]] }

    use { "nvim-lua/plenary.nvim" }
    use { "nvim-telescope/telescope.nvim", config = [[require("config.telescope")]] }

    if utils.executable("tmux") then
    use { "christoomey/vim-tmux-navigator" }
    end

    if utils.executable("latex") then
    use { "lervag/vimtex", ft = { "tex" } }
    end

    if packer_bootstrap then
      require('packer').sync()
    end
end)
