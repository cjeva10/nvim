-- this file just loads the leftover plugins that we don't have a custom config for
return {
    {
        "kylechui/nvim-surround",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvim-surround").setup({})
        end,
    },
    -- comment
    { "numToStr/Comment.nvim", event = { "BufReadPre", "BufNewFile" } },

    -- vim-vyper
    { "vyperlang/vim-vyper",   lazy = true,                           ft = "vyper" },

    -- alpha greeter
    {
        "goolord/alpha-nvim",
        config = function()
            require("alpha").setup(require("alpha.themes.dashboard").config)
        end,
    },

    -- R
    { "jalvesaq/Nvim-R", lazy = true, ft = "r" },

    -- Better buffer closing actions. Available via the buffers helper.
    {
        "kazhala/close-buffers.nvim",
        event = { "VeryLazy" },
        opts = {
            preserve_window_layout = { "this", "nameless" },
        },
        config = function()
            -- better buffer deletion
            local buffers = require("helpers.buffers")
            local map = require("helpers.keys").map
            map("n", "<leader>db", buffers.delete_this, "Current buffer")
            map("n", "<leader>do", buffers.delete_others, "Other buffers")
            map("n", "<leader>da", buffers.delete_all, "All buffers")
        end,
    },

    -- autopairs
    {
        "windwp/nvim-autopairs",
        event = { "InsertEnter" },
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "abecodes/tabout.nvim",
        event = { "InsertEnter" },
        config = function()
            require("tabout").setup({
                tabkey = "<C-l>", -- key to trigger tabout, set to an empty string to disable
                backwards_tabkey = "<C-h>", -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = false, -- shift content if tab out is not possible
                act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                default_shift_tab = "<C-d>", -- reverse shift default action,
                enable_backwards = true, -- well ...
                completion = false, -- if the tabkey is used in a completion pum
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = "`", close = "`" },
                    { open = "(", close = ")" },
                    { open = "[", close = "]" },
                    { open = "{", close = "}" },
                    { open = "<", close = ">" },
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
            })
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "hrsh7th/nvim-cmp",
        },
    },

    -- show insert blanklines
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            -- char = "▏",
            char = "│",
            filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
            show_trailing_blankline_indent = false,
            show_current_context = false,
        },
    },
}
