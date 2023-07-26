return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
            {
                "SmiteshP/nvim-navbuddy",
                dependencies = {
                    "SmiteshP/nvim-navic",
                    "MunifTanjim/nui.nvim",
                },
                opts = { lsp = { auto_attach = true } },
            },
		},
		config = function()
			local status_ok, _ = pcall(require, "lspconfig")
			if not status_ok then
				return
			end

			require("plugins.lsp.mason")
			require("helpers.keys").map("n", "<leader>M", "<cmd>Mason<cr>", "Mason")
		end,
	},
}
