-- this file just loads the leftover plugins that we don't have a custom config for
return {
    {
        "kylechui/nvim-surround",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvim-surround").setup({})
        end,
    },
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
        "windwp/nvim-autopairs",
        event = { "InsertEnter" },
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },
    {
        "stevearc/oil.nvim",
        opts = {},
        dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
        config = function()
            local status_ok, oil = pcall(require, "oil")
            if not status_ok then
                return
            end

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
