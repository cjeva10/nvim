return {
	{
		"folke/which-key.nvim",
		keys = { "<leader>", "g", {"<leader>", mode = "v"} },
		config = function()
			local status_ok, wk = pcall(require, "which-key")
			if not status_ok then
				return
			end
			wk.setup({})

			local opts = {
				mode = "n", -- NORMAL mode
				prefix = "<leader>",
				buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
				silent = true, -- use `silent` when creating keymaps
				noremap = true, -- use `noremap` when creating keymaps
				nowait = true, -- use `nowait` when creating keymaps
			}

			local mappings = {
				["c"] = { require('Comment.api').toggle.linewise.current, "Comment" },
				["w"] = { "<cmd>w!<CR>", "Save" },
				["q"] = { "<cmd>q!<CR>", "Quit" },
				["v"] = { "<cmd>vsplit<cr>", "Vertical Split" },
				["h"] = { "<cmd>split<cr>", "Horizontal Split" },

				d = { name = "Delete" },
				g = { name = "Git" },
				f = { name = "Telescope" },
				l = { name = "LSP" },
				s = { name = "Search" },
				t = { name = "Terminal" },
                b = { name = "Web Tools"},
			}

			local vopts = {
				mode = "v", -- VISUAL mode
				prefix = "<leader>",
				buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
				silent = true, -- use `silent` when creating keymaps
				noremap = true, -- use `noremap` when creating keymaps
				nowait = true, -- use `nowait` when creating keymaps
			}

			local vmappings = {
				["c"] = { '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', "Comment" },
			}

			wk.register(mappings, opts)
			wk.register(vmappings, vopts)
		end,
	},
}
