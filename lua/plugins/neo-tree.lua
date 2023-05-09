return {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup()
        require("helpers.keys").map({ "n", "v" }, "<leader>e", "<cmd>NeoTreeRevealToggle<cr>", "File Tree")
    end,
}
