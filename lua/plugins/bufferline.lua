return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        dependencies = {
            "moll/vim-bbye",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local status_ok, bufferline = pcall(require, "bufferline")
            if not status_ok then
                return
            end

            bufferline.setup({
                highlights = require("catppuccin.groups.integrations.bufferline").get()
            })
        end,
    },
}
