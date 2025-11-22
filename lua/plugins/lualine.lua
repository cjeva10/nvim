return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("lualine").setup({
                options = {
                    theme = "catppuccin",
                    section_separators = '',
                    component_separators = '',
                    sections = {
                        lualine_c = {
                            'filename',
                            path = 3,
                            shorting_target = 0
                        }
                    }
                }
            })
        end,
    },
}
