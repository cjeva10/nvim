return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                prompt_prefix = "  ",
                selection_caret = " ",
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
        map("n", "<leader>d", tb.diagnostics, "Diagnostics")
        map("n", "<leader>f", tb.find_files, "Search files")
        map("n", "<leader>g", tb.live_grep, "Grep")
        map({ "n", "v" }, "gw", tb.grep_string, "Find current word")
    end,
}
