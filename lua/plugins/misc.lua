-- this file just loads the leftover plugins that we don't have a custom config for
return {
    {
        "kylechui/nvim-surround",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvim-surround").setup({})
        end,
    },
    { "numToStr/Comment.nvim", event = { "BufReadPre", "BufNewFile" } },
    { "vyperlang/vim-vyper",   lazy = true,                           ft = "vyper" },
    { "jalvesaq/Nvim-R",       lazy = true,                           ft = "r" },
    {
        "windwp/nvim-autopairs",
        event = { "InsertEnter" },
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
}
