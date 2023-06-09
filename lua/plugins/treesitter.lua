return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			-- parser_config.move = {
			--     install_info = {
			--         url = "/home/chris/coding/move/tree-sitter-move",
			--         files = { "src/parser.c" },
			--     },
			--     filetype = "move",
			-- }
			require("nvim-treesitter.configs").setup({
				autotag = {
					enable = true,
				},
				ensure_installed = {
					"c",
					"cpp",
					"go",
					"javascript",
					"lua",
					-- "move",
					"python",
					"rust",
					"solidity",
					"toml",
					"typescript",
				},
				sync_install = false,
				ignore_install = { "" }, -- List of parsers to ignore installing
				highlight = {
					enable = true, -- false will disable the whole extension
					disable = { "" }, -- list of language that will be disabled
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true, disable = { "yaml" } },
			})
		end,
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},
}
