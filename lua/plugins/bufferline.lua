return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        dependencies = {
            "moll/vim-bbye",
        },
        config = function()
            local status_ok, bufferline = pcall(require, "bufferline")
            if not status_ok then
                return
            end

            local highlights = require("rose-pine.plugins.bufferline")
            bufferline.setup({ highlights = highlights })
        end,
    },
}
