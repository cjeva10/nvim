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
    { "numToStr/Comment.nvim", event = { "BufReadPre", "BufNewFile" }, },

    -- vim-vyper
    { "vyperlang/vim-vyper",   lazy = true, ft = "vyper" },

    -- alpha greeter
    {
        'goolord/alpha-nvim',
        config = function()
            require 'alpha'.setup(require('alpha.themes.dashboard').config)
        end
    },

    -- R
    { "jalvesaq/Nvim-R", lazy = true, ft = "r" },

    -- Better buffer closing actions. Available via the buffers helper.
	{
		"kazhala/close-buffers.nvim",
        event = { "BufReadPre", "BufNewFile" },
		opts = {
			preserve_window_layout = { "this", "nameless" },
		},
	},

    -- autopairs
    {
        "windwp/nvim-autopairs",
        event = { "InsertEnter" },
        config = function()
            require("nvim-autopairs").setup {}
        end,
    },
    {
        "abecodes/tabout.nvim",
        event = { "InsertEnter" },
        config = function()
            require('tabout').setup {
                tabkey = 'fj', -- key to trigger tabout, set to an empty string to disable
                backwards_tabkey = 'jf', -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = false, -- shift content if tab out is not possible
                act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                default_shift_tab = '<C-d>', -- reverse shift default action,
                enable_backwards = true, -- well ...
                completion = false, -- if the tabkey is used in a completion pum
                tabouts = {
                  {open = "'", close = "'"},
                  {open = '"', close = '"'},
                  {open = '`', close = '`'},
                  {open = '(', close = ')'},
                  {open = '[', close = ']'},
                  {open = '{', close = '}'}
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
            }
        end,
        dependencies =
            {
                "nvim-treesitter/nvim-treesitter",
                "hrsh7th/nvim-cmp",
            },
    },
}
