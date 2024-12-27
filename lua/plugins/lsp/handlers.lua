local M = {}

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.documentHighlight then
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

local function lsp_keymaps(bufnr)
	local lsp_map = require("helpers.keys").lsp_map
    local tb = require("telescope.builtin")

    lsp_map("go", vim.diagnostic.open_float, bufnr, "Open diagnostic")
	lsp_map("gd", vim.lsp.buf.definition, bufnr, "Goto Definition")
	lsp_map("gr", tb.lsp_references, bufnr, "Goto References")
	lsp_map("gI", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
	lsp_map("<leader>k", vim.lsp.buf.hover, bufnr, "Hover Documentation")
	lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")

	lsp_map("<leader>la", vim.lsp.buf.code_action, bufnr, "Code Action")
	lsp_map("<leader>ld", vim.diagnostic.setloclist, bufnr, "Document Diagnostics")
	lsp_map("<leader>lf", vim.lsp.buf.format, bufnr, "Format")
	lsp_map("<leader>li", "<cmd>LspInfo<cr>", bufnr, "Info")
	lsp_map("<leader>lI", "<cmd>LspInstall<cr>", bufnr, "Lsp Install")
	lsp_map("<leader>lj", vim.diagnostic.goto_next, bufnr, "Next Diagnostic")
	lsp_map("<leader>lk", vim.diagnostic.goto_prev, bufnr, "Previous Diagnostic")
	lsp_map("<leader>ll", vim.lsp.codelens.run, bufnr, "CodeLens Action")
	lsp_map("<leader>lr", vim.lsp.buf.rename, bufnr, "Rename symbol")
	lsp_map("<leader>lR", "<cmd>LspRestart<cr>", bufnr, "Lsp Restart")
	lsp_map("<leader>ls", tb.lsp_document_symbols, bufnr, "Document symbols")
	lsp_map("<leader>lS", tb.lsp_dynamic_workspace_symbols, bufnr, "Workspace Symbols")
	lsp_map("<leader>lt", vim.lsp.buf.type_definition, bufnr, "Type definition")
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
