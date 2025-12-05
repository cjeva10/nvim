local M = {}

local function lsp_keymaps(bufnr)
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

M.on_attach = function(_, bufnr)
    lsp_keymaps(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

return M
