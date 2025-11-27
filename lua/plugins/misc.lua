-- this file just loads the leftover plugins that we don't have a custom config for
return {
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local comment = require("Comment.api")
            local map = require("helpers.keys").map
            map("n", "<leader>c", comment.toggle.linewise.current, "Comment")
            map("v", "<leader>c", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
                "Comment visual")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "stevearc/oil.nvim",
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
        },
        config = function()
            local oil = require("oil")

            oil.setup({
                view_options = {
                    show_hidden = true,
                },
            })

            local is_oil_open = function()
                if vim.bo.filetype == "oil" then
                    return true
                else
                    return false
                end
            end

            local oil_toggle = function()
                if is_oil_open() then
                    oil.close()
                else
                    oil.open()
                end
            end

            local map = require("helpers.keys").map
            map({ "n", "v" }, "<leader>e", oil_toggle, "Open parent directory")
        end,
    },
}
