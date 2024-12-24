local C = {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    -- setup must be called before loading
    config = function()
        local catppuccin = require("catppuccin")
        catppuccin.setup({
            flavour = "macchiato", -- latte, frappe, macchiato, mocha
            transparent_background = false,
            term_colors = true,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                telescope = true,
                treesitter = true,
                mason = true,
                notify = false,
                mini = true,
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        })
        catppuccin.load()
    end,
}

local V = {
    "Mofiqul/vscode.nvim",
    name = "vscode",
    lazy = false,
    priority = 1000,
    config = function()
        local vscode = require("vscode")
        vscode.setup({})
        vim.cmd("colorscheme vscode")
    end,
}

local R = {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
        require("rose-pine").setup({})

        vim.cmd("colorscheme rose-pine")
    end,
}

local T = {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({})
        vim.cmd("colorscheme tokyonight")
    end,
}

return { C }
