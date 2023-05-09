return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },
    {
		"tpope/vim-fugitive",
        event = { "BufReadPre", "BufNewFile" },
		config = function ()
			local map = require("helpers.keys").map
			map("n", "<leader>ga", "<cmd>Git add %<cr>", "Add")
			map("n", "<leader>gb", "<cmd>Git blame<cr>", "Blame")
			map("n", "<leader>gc", "<cmd>Git commit<cr>", "Commit")
			map("n", "<leader>gd", "<cmd>Git diff<cr>", "Diff")
			map("n", "<leader>gs", "<cmd>Git<cr>", "Summary")
		end
	}
}
