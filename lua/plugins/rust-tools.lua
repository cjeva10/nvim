return {
    {
        "simrat39/rust-tools.nvim",
        ft = { "rust" },
        config = function()
            local status_ok, rt = pcall(require, "rust-tools")
            if not status_ok then
              return
            end

            local opts = {
              server = {
                on_attach = require("plugins.lsp.handlers").on_attach,
                capabilities = require("plugins.lsp.handlers").capabilities,
                settings = {
                    checkOnSave = {
                        overrideCommand = {
                            "cargo",
                            "cargo-watch",
                            "clippy",
                            "--workspace",
                            "--message-format=json",
                            "--all-targets",
                            "--all-features",
                        }
                    }
                },
                -- standalone file support
                -- setting it to false may improve startup time
                standalone = false,
              },
            }
            rt.setup(opts)
        end,
    }
}
