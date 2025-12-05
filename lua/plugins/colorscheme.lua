return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			local catppuccin = require("catppuccin")
			catppuccin.setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
			})
			catppuccin.load()
		end,
	},
}
