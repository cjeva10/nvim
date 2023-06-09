return {
    "ray-x/web-tools.nvim",
    event = { "BufReadPost *.html", "BufReadPost *.css", "BufNewFile *.html", "BufNewFile *.css" },
    config = function ()
        local status_ok, web_tools = pcall(require, "web-tools")
        if not status_ok then
            return
        end

        web_tools.setup({
            keymaps = {
                rename = nil,
                repeat_rename = '.',
            },
            hurl = {
                show_headers = false,
                floating = false,
                formatters = {
                    json = { 'jq' },
                    html = { 'prettier', '--parser', 'html' },
                },
            },
        })

        local map = require("helpers.keys").map

        map("n", "<leader>bo", "<cmd>BrowserOpen<cr>", "browser open")
        map("n", "<leader>bs", "<cmd>BrowserSync<cr>", "browser sync")
        map("n", "<leader>br", "<cmd>BrowserRestart<cr>", "browser restart")
        map("n", "<leader>bq", "<cmd>BrowserStop<cr>", "browser stop")
        map("n", "<leader>bp", "<cmd>BrowserPreview<cr>", "browser preview")

    end,
}
