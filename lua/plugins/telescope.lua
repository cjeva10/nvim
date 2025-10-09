return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
			{ "nvim-telescope/telescope-frecency.nvim" },
		},
		config = function()
			local status_ok, telescope = pcall(require, "telescope")
			if not status_ok then
				return
			end

			telescope.setup({
				defaults = {
					prompt_prefix = " ",
					selection_caret = " ",
					path_display = { "smart" },
				},

				extensions = {
					media_files = {
						-- filetypes whitelist
						filetypes = {
							"jpeg",
							"jpg",
							"mp4",
							"pdf",
							"png",
							"webp",
							"webm",
						},
						find_cmd = "rg", -- find command (defaults to `fd`)
					},
				},
			})
			pcall(telescope.load_extension, "media_files")
			pcall(telescope.load_extension, "fzf")
			pcall(telescope.load_extension, "frecency")

			local map = require("helpers.keys").map
			local tb = require("telescope.builtin")
			map("n", "<leader>/", tb.current_buffer_fuzzy_find, "Search current buffer")

			map("n", "<leader>b", tb.buffers, "Open buffers")
			map("n", "<leader>j", tb.jumplist, "Jump list")
			map("n", "<leader>m", tb.marks, "Marks")
			map("n", "<leader>d", tb.diagnostics, "Diagnostics")
			map("n", "<leader>f", tb.find_files, "Search files")
			map("n", "<leader>g", tb.live_grep, "Grep")
			map("n", "<leader>h", tb.oldfiles, "Recently opened files")
			map("n", "gw", tb.grep_string, "Find current word")

			map("n", "<leader>sc", tb.commands, "Commands")
			map("n", "<leader>sh", tb.help_tags, "Find Help")
			map("n", "<leader>sk", tb.keymaps, "Keymaps")
			map("n", "<leader>sm", tb.man_pages, "Man Pages")
			map("n", "<leader>sr", tb.registers, "Registers")
			map("n", "<leader>ss", tb.colorscheme, "Colorscheme")
		end,
	},
}
