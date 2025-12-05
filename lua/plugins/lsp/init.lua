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

local on_attach = function(_, bufnr)
    local lsp_map = require("helpers.keys").lsp_map
    local tb = require("telescope.builtin")

    lsp_map("gd", vim.lsp.buf.definition, bufnr, "Goto Definition")
    lsp_map("gr", tb.lsp_references, bufnr, "Goto References")
    lsp_map("gI", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
    lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")

    lsp_map("<leader>a", vim.lsp.buf.code_action, bufnr, "Code Action")
    lsp_map("<leader>r", vim.lsp.buf.rename, bufnr, "Rename symbol")
    lsp_map("<leader>o", vim.diagnostic.open_float, bufnr, "Open diagnostic")
    lsp_map("<leader>ld", vim.diagnostic.setloclist, bufnr, "Document Diagnostics")
    lsp_map("<leader>lf", vim.lsp.buf.format, bufnr, "Format")
end

return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "saghen/blink.cmp",
        },
        config = function()
            local opts = {
                on_attach = on_attach,
                capabilities = require("blink.cmp").get_lsp_capabilities(
                    vim.lsp.protocol.make_client_capabilities()
                ),
            }

            for _, server in pairs(servers) do
                -- fix offset_encoding warning with clangd
                if server == "clangd" then
                    opts.capabilities.offsetEncoding = { "utf-16" }
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
