vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

local telescope = require("telescope")

telescope.setup({
    defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        path_display = { "truncate" },
        layout_config = {
            preview_width = 0.5,
        },
    },
})
telescope.load_extension("fzf")

local map = require("helpers").map
local tb = require("telescope.builtin")

map("n", "<leader>/", tb.current_buffer_fuzzy_find, "Search current buffer")
map("n", "<leader>b", tb.buffers, "Open buffers")
map("n", "<leader>d", function() tb.diagnostics({ bufnr = 0 }) end, "Document Diagnostics")
map("n", "<leader>D", tb.diagnostics, "Workspace Diagnostics")
map("n", "<leader>f", tb.find_files, "Search files")
map("n", "<leader>g", tb.live_grep, "Grep")
map({ "n", "v" }, "gw", tb.grep_string, "Find current word")
