return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
		},
		config = function()
			local status_ok, telescope = pcall(require, "telescope")
			if not status_ok then
				return
			end

			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					prompt_prefix = " ",
					selection_caret = " ",
					path_display = { "smart" },

					mappings = {
						i = {

							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,
						},
					},
				},

				extensions = {
					media_files = {
						-- filetypes whitelist
						-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
						filetypes = { "png", "webp", "jpg", "jpeg" },
						find_cmd = "rg", -- find command (defaults to `fd`)
					},
				},
			})
            pcall(telescope.load_extension, "media_files")
            pcall(telescope.load_extension, "fzf")

            local map = require("helpers.keys").map
            local tb = require("telescope.builtin")
			map("n", "<leader>/", tb.current_buffer_fuzzy_find, "Search current buffer")

			map("n", "<leader>fb", tb.buffers, "Open buffers")
            map("n", "<leader>fc", tb.git_branches, "Checkout git branches")
			map("n", "<leader>fd", tb.diagnostics, "Diagnostics")
			map("n", "<leader>ff", tb.find_files, "Search files")
			map("n", "<leader>fg", tb.live_grep, "Grep")
			map("n", "<leader>fr", tb.oldfiles, "Recently opened files")
			map("n", "<leader>fw", tb.grep_string, "Find current word")

            map("n", "<leader>sc", tb.commands, "Commands")
            map("n", "<leader>sh", tb.help_tags, "Find Help")
            map("n", "<leader>sk", tb.keymaps, "Keymaps")
            map("n", "<leader>sm", tb.man_pages, "Man Pages")
            map("n", "<leader>sr", tb.registers, "Registers")
            map("n", "<leader>ss", tb.colorscheme, "Colorscheme")
		end,
	},
}
