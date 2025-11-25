return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
            { "nvim-tree/nvim-web-devicons" },
        },
        config = function()
            local status_ok, telescope = pcall(require, "telescope")
            if not status_ok then
                return
            end

            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    path_display = { "smart" },
                },

            })
            pcall(telescope.load_extension, "fzf")

            local map = require("helpers.keys").map
            local tb = require("telescope.builtin")
            map("n", "<leader>/", tb.current_buffer_fuzzy_find, "Search current buffer")

            map("n", "<leader>b", tb.buffers, "Open buffers")
            map("n", "<leader>j", tb.jumplist, "Jump list")
            map("n", "<leader>m", tb.marks, "Marks")
            map("n", "<leader>d", tb.diagnostics, "Diagnostics")
            map("n", "<leader>f", tb.find_files, "Search files")
            map("n", "<leader>g", tb.live_grep, "Grep")
            map("n", "<leader>h", tb.oldfiles, "Recently opened files")
            map("n", "gw", tb.grep_string, "Find current word")
        end,
    },
}
