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
    local lsp_map = require("helpers").lsp_map
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

local opts = {
    on_attach = on_attach,
}

for _, server in pairs(servers) do
    vim.lsp.config(server, opts)
    vim.lsp.enable(server)
end
