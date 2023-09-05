return {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                }
            }
        })
        require("helpers.keys").map({ "n", "v" }, "<leader>e", "<cmd>Neotree toggle<cr>", "File Tree")
    end,
}
