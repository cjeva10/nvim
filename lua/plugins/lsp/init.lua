return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
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
