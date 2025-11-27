return {
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
