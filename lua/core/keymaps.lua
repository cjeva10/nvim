local keys = require("helpers.keys")
local map = keys.map
local set_leader = keys.set_leader

set_leader(" ")

--   Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- use spc-w to edit windows
map("n", "<leader>w", "<C-w>")
map("n", "<leader>v", "<C-w>v")
map("n", "<leader> ", "<C-w>w")

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

-- Save 
map("n", "<leader>w ", ":w<CR>")

-- close all
map("n", "<leader>qq", ":qa!<CR>")

-- Visual --
-- Stay in indent mode when moving indents
map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<", "<<")
map("n", ">", ">>")
