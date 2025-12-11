return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
        local catppuccin = require("catppuccin")
        catppuccin.setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
        })
        catppuccin.load()
    end,
}
