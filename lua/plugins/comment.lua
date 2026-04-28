vim.pack.add({
    { src = "https://github.com/numToStr/Comment.nvim" },
})

local comment = require("Comment.api")
local map = require("helpers").map
map("n", "<leader>c", comment.toggle.linewise.current, "Comment")
map("v", "<leader>c", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
    "Comment visual")
