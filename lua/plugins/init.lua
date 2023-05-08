return {
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },

    -- colorscheme
    { 
        "catppuccin/nvim", 
        lazy = false,
        priority = 1000,
    },

    -- completion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },

    -- snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },

    -- LSP 
    { "neovim/nvim-lspconfig", lazy = true },
    { "williamboman/mason.nvim", lazy = true },
    { "williamboman/mason-lspconfig.nvim", lazy = true },
    { "simrat39/rust-tools.nvim", lazy = true },

    -- Telescope
    { "nvim-telescope/telescope.nvim", lazy = true },
    { "nvim-telescope/telescope-media-files.nvim", lazy = true },

    -- Nvim-tree
    { "kyazdani42/nvim-web-devicons", lazy = true },
    { "kyazdani42/nvim-tree.lua", lazy = true },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = true,
    },

    -- Bufferline
    { "akinsho/bufferline.nvim", lazy = true },
    { "moll/vim-bbye", lazy = true },

    -- Lualine
    { 'nvim-lualine/lualine.nvim', lazy = true },

    -- ToggleTerm
    { 
        "akinsho/toggleterm.nvim",
        lazy = true,
    },

    -- Whichkey
    { 
        "folke/which-key.nvim",
        lazy = true,
    },

    -- gitsigns
    { 
        "lewis6991/gitsigns.nvim",
        lazy = true,
    },

    -- comment
    { 
        "numToStr/Comment.nvim",
        lazy = true,
    },

    -- vim-vyper
    { 
        "vyperlang/vim-vyper",
        lazy = true
    },

    -- alpha greeter
    -- { 
    --     'goolord/alpha-nvim',
    --     config = function ()
    --         require'alpha'.setup(require'alpha.themes.dashboard'.config)
    --     end
    -- },

    { 
        "jalvesaq/Nvim-R",
        lazy = true
    },
}
