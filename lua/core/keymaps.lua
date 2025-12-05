--   Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local map = require("helpers.keys").map

vim.g.mapleader = " "

-- open terminal in current window
map("n", "<leader>t", ":term<CR>")
map("t", "<esc>", "<C-\\><C-n>")

-- helix-like g motions
map("n", "gh", "0")
map("n", "gs", "^")
map("n", "gl", "$")
map("n", "ge", "G")

-- Redo
map("n", "U", "<C-r>")

-- close all
map("n", "<leader>qq", ":qa!<CR>")

-- Visual --
-- Stay in indent mode when moving indents
map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<", "<<")
map("n", ">", ">>")

-- edit todos file
map("n", "<leader>x", ":e ~/todos.md<CR>")
