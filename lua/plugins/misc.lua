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
    	    map("v", "hleaderhc", comment.toggle.linewise.current, "Comment")
        end,

    },
    { "vyperlang/vim-vyper",   lazy = true, ft = "vyper" },
    { "jalvesaq/Nvim-R",       lazy = true, ft = "r" },
    {
        "windwp/nvim-autopairs",
        event = { "InsertEnter" },
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
}
