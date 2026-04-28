vim.pack.add({
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/stevearc/oil.nvim" },
})

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
