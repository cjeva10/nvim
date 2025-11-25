local servers = {
    "clangd",
    "gopls",
    "jsonls",
    "lua_ls",
    "pyright",
    "ruby_lsp",
    "ruff",
    "rust_analyzer",
    "solidity_ls_nomicfoundation",
    "ts_ls",
}

return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "saghen/blink.cmp",
        },
        config = function()
            local capabilities = require("plugins.lsp.handlers").capabilities
            local opts = {
                on_attach = require("plugins.lsp.handlers").on_attach,
                capabilities = capabilities,
            }

            for _, server in pairs(servers) do
                -- fix offset_encoding warning with clangd
                if server == "clangd" then
                    capabilities.offsetEncoding = { "utf-16" }
                end

                local require_ok, lang_opts = pcall(require, "plugins.lsp.settings." .. server)
                local conf_opts = {}
                if require_ok then
                    conf_opts = vim.tbl_deep_extend("force", lang_opts, opts)
                else
                    conf_opts = opts
                end

                vim.lsp.config(server, conf_opts)
                vim.lsp.enable(server)
            end
        end,
    },
}
