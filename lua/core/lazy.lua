-- install lazy.nvim if it's not already
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

-- load plugin manager lazy.nvim with protected call
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return
end

-- set the leader key before loading plugins
require("helpers.keys").set_leader(" ")

-- Also have an easy keybind to access lazy
require("helpers.keys").map("n", "<leader>L", lazy.show, "Show Lazy")

-- load all our plugins
lazy.setup("plugins")
