return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup {
              ensure_installed = {
                "lua",
                "python",
                "rust",
                "toml",
                "c",
                "javascript",
                "typescript",
                "solidity",
                "cpp",
                "go"
              },
              sync_install = false,
              ignore_install = { "" }, -- List of parsers to ignore installing
              highlight = {
                enable = true, -- false will disable the whole extension
                disable = { "" }, -- list of language that will be disabled
                additional_vim_regex_highlighting = false,

              },
              indent = { enable = true, disable = { "yaml" } },
            }
        end,
        build = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true}))
        end,
    }
}
