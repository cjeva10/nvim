return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'main',
        lazy = false,
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        config = function()
            local treesitter_configs = require("nvim-treesitter.configs")

            treesitter_configs.setup({
                ensure_installed = {
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
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                            ["as"] = "@local.scope",
                        },
                    },
                },
                autotag = {
                    enable = true,
                },
                sync_install = false,
                ignore_install = { "" }, -- list of parsers to ignore installing
                highlight = {
                    enable = true,       -- false will disable the whole extension
                    disable = { "" },    -- list of language that will be disabled
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true, disable = { "yaml" } },
            })
        end,
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    },
}
