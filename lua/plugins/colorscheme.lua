vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

local catppuccin = require("catppuccin")
catppuccin.setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
})
catppuccin.load()
