return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = {
            "AndreM222/copilot-lualine",
        },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "catppuccin"
                }
            })
        end,
    },
}
