local M = {}

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlight then
        vim.api.nvim_exec2(
            [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
            {}
        )
    end
end

local function lsp_keymaps(bufnr)
    local lsp_map = require("helpers.keys").lsp_map
    local tb = require("telescope.builtin")

    lsp_map("gd", vim.lsp.buf.definition, bufnr, "Goto Definition")
    lsp_map("gr", tb.lsp_references, bufnr, "Goto References")
    lsp_map("gI", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
    lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")

    lsp_map("<leader>k", vim.lsp.buf.hover, bufnr, "Hover Documentation")
    lsp_map("<leader>a", vim.lsp.buf.code_action, bufnr, "Code Action")
    lsp_map("<leader>s", tb.lsp_document_symbols, bufnr, "Document symbols")
    lsp_map("<leader>r", vim.lsp.buf.rename, bufnr, "Rename symbol")
    lsp_map("<leader>o", vim.diagnostic.open_float, bufnr, "Open diagnostic")
    lsp_map("<leader>ld", vim.diagnostic.setloclist, bufnr, "Document Diagnostics")
    lsp_map("<leader>lf", vim.lsp.buf.format, bufnr, "Format")
    lsp_map("<leader>li", "<cmd>LspInfo<cr>", bufnr, "Info")
    lsp_map("<leader>lj", function() vim.diagnostic.jump({ count = 1, float = true }) end, bufnr, "Next Diagnostic")
    lsp_map("<leader>lk", function() vim.diagnostic.jump({ count = -1, float = true }) end, bufnr, "Previous Diagnostic")
    lsp_map("<leader>lr", "<cmd>LspRestart<cr>", bufnr, "Lsp Restart")
    lsp_map("<leader>ls", tb.lsp_dynamic_workspace_symbols, bufnr, "Workspace Symbols")
    lsp_map("<leader>lt", vim.lsp.buf.type_definition, bufnr, "Type definition")
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

M.capabilities = capabilities

return M
