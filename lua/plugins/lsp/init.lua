local servers = {
    "clangd",
    "gopls",
    "jsonls",
    "lua_ls",
    "pyright",
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
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local status_ok, lspconfig = pcall(require, "lspconfig")
            if not status_ok then
                return
            end

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

                server = vim.split(server, "@")[1]

                local require_ok, lang_opts = pcall(require, "plugins.lsp.settings." .. server)
                local conf_opts = {}
                if require_ok then
                    conf_opts = vim.tbl_deep_extend("force", lang_opts, opts)
                else
                    conf_opts = opts
                end

                lspconfig[server].setup(conf_opts)
            end
        end,
    },
}
