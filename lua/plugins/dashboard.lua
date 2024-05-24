return {
    {
        "nvimdev/dashboard-nvim",
        name = "dashboard",
        event = "VimEnter",
        config = function()
            local status_ok, dashboard = pcall(require, "dashboard")
            if not status_ok then
                return
            end

            dashboard.setup({
                theme = "hyper",
                config = {
                    header = {
                        " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
                        " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
                        " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
                        " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
                        " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
                        " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
                        "",
                    },
                    shortcut = {
                        { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
                        {
                            desc = " Files",
                            group = "Label",
                            action = "Telescope find_files",
                            key = "f",
                        },
                        {
                            desc = " Recent files",
                            group = "DiagnosticHint",
                            action = "Telescope frecency",
                            key = "r",
                        },
                    },
                    footer = { "", "Version: " .. tostring(vim.version()) },
                },
            })
        end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },
}
