return {
    {
        "folke/which-key.nvim",
        keys = { "<leader>", "g" },
        config = function()
            local status_ok, wk = pcall(require, "which-key")
            if not status_ok then
                return
            end
            wk.setup({})

            local opts = {
                mode = "n", -- NORMAL mode
                prefix = "<leader>",
                buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
                silent = true, -- use `silent` when creating keymaps
                noremap = true, -- use `noremap` when creating keymaps
                nowait = true, -- use `nowait` when creating keymaps
            }

            local buffers = require("helpers.buffers")

            local mappings = {
                ["c"] = { "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", "Comment" },
                -- ["e"] = { "<cmd>NeoTreeFocusToggle<cr>", "Explorer" },
                ["w"] = { "<cmd>w!<CR>", "Save" },
                ["q"] = { "<cmd>q!<CR>", "Quit" },

                d = { name = "Delete" },

                f = { name = "Telescope" },
                ["F"] = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
                ["v"] = { "<cmd>vsplit<cr>", "Vertical Split" },
                ["h"] = { "<cmd>split<cr>", "Horizontal Split" },

                g = {
                    name = "Git",
                },

                l = {
                    name = "LSP",
                    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
                    d = {
                        "<cmd>lua vim.diagnostic.setloclist()<cr>",
                        "Document Diagnostics",
                    },
                    w = {
                        "<cmd>Telescope diagnostics<cr>",
                        "Workspace Diagnostics",
                    },
                    f = { "<cmd>lua vim.lsp.buf.format({async='true'})<cr>", "Format" },
                    i = { "<cmd>LspInfo<cr>", "Info" },
                    I = { "<cmd>LspInstall<cr>", "Lsp Install" },
                    j = {
                        "<cmd>lua vim.diagnostic.goto_next()<CR>",
                        "Next Diagnostic",
                    },
                    k = {
                        "<cmd>lua vim.diagnostic.goto_prev()<cr>",
                        "Prev Diagnostic",
                    },
                    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
                    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
                    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
                    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
                    S = {
                        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
                        "Workspace Symbols",
                    },
                },
                s = {
                    name = "Search",
                    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
                    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
                    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
                    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
                    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
                    R = { "<cmd>Telescope registers<cr>", "Registers" },
                    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
                    C = { "<cmd>Telescope commands<cr>", "Commands" },
                },

                t = {
                    name = "Terminal",
                    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
                    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
                    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
                    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
                    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
                    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
                    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
                },
            }

            local vopts = {
                mode = "v", -- VISUAL mode
                prefix = "<leader>",
                buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
                silent = true, -- use `silent` when creating keymaps
                noremap = true, -- use `noremap` when creating keymaps
                nowait = true, -- use `nowait` when creating keymaps
            }

            local vmappings = {
                ["c"] = { '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', "Comment" },
            }

            wk.register(mappings, opts)
            wk.register(vmappings, vopts)
        end,
    },
}
