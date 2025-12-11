return {
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

        local oil_toggle = function()
            if vim.bo.filetype == "oil" then
                oil.close()
            else
                oil.open()
            end
        end

        local map = require("helpers").map
        map({ "n", "v", "x" }, "<leader>e", oil_toggle, "Open parent directory")
    end,
}
