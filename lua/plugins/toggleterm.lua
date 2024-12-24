return {
    {
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        keys = { "<C-t>", "<leader>" },
        config = function()
            local status_ok, toggleterm = pcall(require, "toggleterm")
            if not status_ok then
                return
            end

            toggleterm.setup({
                size = 120,
                open_mapping = [[<c-t>]],
                hide_numbers = true,
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                persist_size = true,
                direction = "vertical",
                close_on_exit = true,
                shell = vim.o.shell,
                float_opts = {
                    border = "curved",
                    winblend = 0,
                },
            })

            function _G.set_terminal_keymaps()
                local opts = { noremap = true }
                vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
                vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
                vim.api.nvim_buf_set_keymap(0, "t", "<C-n>", [[2<C-\>]], opts)
                vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-l>]], opts)
            end

            vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

            -- bind different terminal functions
            local map = require("helpers.keys").map
            map("n", "<leader>t", "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical")
        end,
    },
}
