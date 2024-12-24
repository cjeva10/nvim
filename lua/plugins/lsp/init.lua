-- all the lsp servers I want to use
local servers = {
    "lua_ls",
    "pyright",
    "jsonls",
    "rust_analyzer",
    "clangd",
    "gopls",
    "ruff",
    "solidity",
    "ts_ls",
}

return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local status_ok, _ = pcall(require, "lspconfig")
            if not status_ok then
                return
            end

            local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
            if not lspconfig_status_ok then
                return
            end

            local opts = {}

            for _, server in pairs(servers) do
                -- fix offset_encoding warning with clangd
                local capabilities = require("plugins.lsp.handlers").capabilities
                if server == "clangd" then
                    capabilities.offsetEncoding = { "utf-16" }
                end

                opts = {
                    on_attach = require("plugins.lsp.handlers").on_attach,
                    capabilities = capabilities,
                }
                server = vim.split(server, "@")[1]

                local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)
                if require_ok then
                    opts = vim.tbl_deep_extend("force", conf_opts, opts)
                end

                lspconfig[server].setup(opts)
            end
        end,
    },
}
