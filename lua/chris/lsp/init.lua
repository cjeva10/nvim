local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("chris.lsp.mason")
-- require("chris.lsp.handlers").setup()
-- require("chris.lsp.null-ls")
