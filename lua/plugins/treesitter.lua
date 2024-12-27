return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
            if not status_ok then
                return
            end

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
                        selection_modes = {
                            ['@parameter.outer'] = 'v', -- charwise
                            ['@function.outer'] = 'v',  -- linewise
                            ['@class.outer'] = '<c-v>', -- blockwise
                        },
                    },
                },
                autotag = {
                    enable = true,
                },
                sync_install = false,
                ignore_install = { "" }, -- list of parsers to ignore installing
                highlight = {
                    enable = true, -- false will disable the whole extension
                    disable = { "" }, -- list of language that will be disabled
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true, disable = { "yaml" } },
            })
        end,
        build = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        end,
    },
}
