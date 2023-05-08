return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local status_ok, _ = pcall(require, "lspconfig")
            if not status_ok then
                return
            end

            require("plugins.lsp.mason")
        end,
    }
}
