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
			map("n", "<leader>fr", require("telescope.builtin").oldfiles, "Recently opened")
			map("n", "<leader>fb", require("telescope.builtin").buffers, "Open buffers")
			map("n", "<leader>f/", require("telescope.builtin").current_buffer_fuzzy_find, "Search current buffer")
			map("n", "<leader>ff", require("telescope.builtin").find_files, "Files")
			map("n", "<leader>fh", require("telescope.builtin").help_tags, "Help")
			map("n", "<leader>fw", require("telescope.builtin").grep_string, "Current word")
			map("n", "<leader>fg", require("telescope.builtin").live_grep, "Grep")
			map("n", "<leader>fd", require("telescope.builtin").diagnostics, "Diagnostics")
			map("n", "<leader>fk", require("telescope.builtin").keymaps, "Search keymaps")
		end,
	},
}
