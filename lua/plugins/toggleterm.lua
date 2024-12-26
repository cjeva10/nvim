return {
    {
        "akinsho/toggleterm.nvim",
        config = function()
            local status_ok, toggleterm = pcall(require, "toggleterm")
            if not status_ok then
                return
            end

            toggleterm.setup({
                size = 80,
                open_mapping = [[<C-t>]],
                shading_factor = 2,
                direction = "vertical",
            })

            function _G.set_terminal_keymaps()
                local opts = { noremap = true }
                vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
                vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
                vim.api.nvim_buf_set_keymap(0, "t", "<C-n>", [[2<C-\>]], opts)
                vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-l>]], opts)
            end

            vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
        end,
    },
}
