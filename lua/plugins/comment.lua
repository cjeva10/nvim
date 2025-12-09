return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local comment = require("Comment.api")
        local map = require("helpers.keys").map
        map("n", "<leader>c", comment.toggle.linewise.current, "Comment")
        map("v", "<leader>c", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
            "Comment visual")
    end,
}
