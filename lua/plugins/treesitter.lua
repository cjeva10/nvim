return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'main',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local filetypes = {
            "c",
            "cpp",
            "go",
            "html",
            "htmldjango",
            "javascript",
            "java",
            "lua",
            "python",
            "ruby",
            "rust",
            "solidity",
            "toml",
            "typescript",
        }

        require("nvim-treesitter").install(filetypes)

        vim.api.nvim_create_autocmd('FileType', {
            pattern = filetypes,
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
