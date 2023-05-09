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
    { "numToStr/Comment.nvim", lazy = true },

    -- vim-vyper
    { "vyperlang/vim-vyper",   lazy = true },

    -- alpha greeter
    {
        'goolord/alpha-nvim',
        config = function()
            require 'alpha'.setup(require('alpha.themes.dashboard').config)
        end
    },

    -- R
    { "jalvesaq/Nvim-R", lazy = true },

    -- Better buffer closing actions. Available via the buffers helper.
	{
		"kazhala/close-buffers.nvim",
        lazy = true,
		opts = {
			preserve_window_layout = { "this", "nameless" },
		},
	},
}