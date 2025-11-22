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
                highlights = require("catppuccin.special.bufferline").get_theme(),
                options = {
                    numbers = 'ordinal',
                }
            })

            local map = require("helpers.keys").map

            map("n", "<leader>1", function() bufferline.go_to(1) end, "Goto Buffer 1")
            map("n", "<leader>2", function() bufferline.go_to(2) end, "Goto Buffer 2")
            map("n", "<leader>3", function() bufferline.go_to(3) end, "Goto Buffer 3")
            map("n", "<leader>4", function() bufferline.go_to(4) end, "Goto Buffer 4")
            map("n", "<leader>5", function() bufferline.go_to(5) end, "Goto Buffer 5")
            map("n", "<leader>6", function() bufferline.go_to(6) end, "Goto Buffer 6")
            map("n", "<leader>7", function() bufferline.go_to(7) end, "Goto Buffer 7")
            map("n", "<leader>9", function() bufferline.go_to(9) end, "Goto Buffer 9")
            map("n", "<leader>-1", function() bufferline.go_to(-1) end, "Goto Buffer -1")
        end,
    },
}
