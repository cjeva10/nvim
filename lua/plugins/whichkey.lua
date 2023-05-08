return {
    {
        "folke/which-key.nvim",
        config = function()
            local status_ok, wk = pcall(require, "which-key")
            if not status_ok then
                return
            end
            wk.setup {}

            local opts = {
                mode = "n", -- NORMAL mode
                prefix = "<leader>",
                buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
                silent = true, -- use `silent` when creating keymaps
                noremap = true, -- use `noremap` when creating keymaps
                nowait = true, -- use `nowait` when creating keymaps
            }

            local mappings = {
                ["/"] = { "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", "Comment" },
                ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
                ["b"] = {
                    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer=false})<cr>",
                    "Buffers",
                },
                ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
                ["w"] = { "<cmd>w!<CR>", "Save" },
                ["q"] = { "<cmd>q!<CR>", "Quit" },
                ["c"] = { "<cmd>bdelete!<CR>", "Close Buffer" },
                ["f"] = {
                    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes'))<cr>",
                    "Find files",
                },
                ["F"] = { "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes'))<cr>", "Find Text" },
                ["P"] = { "<cmd>Telescope projects<cr>", "Projects" },
                ["v"] = { "<cmd>vsplit<cr>", "Vertical Split" },
                ["h"] = { "<cmd>split<cr>", "Horizontal Split" },

                g = {
                    name = "Git",
                    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
                    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
                    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
                    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
                    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
                    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
                    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
                    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
                    u = {
                        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
                        "Undo Stage Hunk",
                    },
                    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
                    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
                    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
                    d = {
                        "<cmd>Gitsigns diffthis HEAD<cr>",
                        "Diff",
                    },
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

            vopts = {
                mode = "v", -- VISUAL mode
                prefix = "<leader>",
                buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
                silent = true, -- use `silent` when creating keymaps
                noremap = true, -- use `noremap` when creating keymaps
                nowait = true, -- use `nowait` when creating keymaps
            }

            vmappings = {
                ["/"] = { "<ESC><CMD>lua require(\"Comment.api\").toggle.linewise(vim.fn.visualmode())<CR>", "Comment" },
            }

            wk.register(mappings, opts)
            wk.register(vmappings, vopts)
        end,
    }
}