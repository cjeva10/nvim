-- load options and keymaps before plugins
require("options")
require("keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return
end
lazy.setup("plugins")

-- custom configurations for each plugin
-- require("chris.colorscheme")
-- require("chris.cmp")
require("chris.lsp")
require("chris.toggleterm")
require("chris.telescope")
require("chris.nvim-tree")
require("chris.bufferline")
require("chris.whichkey")
require("chris.gitsigns")
require("chris.comment")
require("chris.lualine")
require("chris.rust-tools")
