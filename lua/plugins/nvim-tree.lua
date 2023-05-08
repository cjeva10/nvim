return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local status_ok, nvim_tree = pcall(require, "nvim-tree")
        if not status_ok then
          return
        end
        nvim_tree.setup({
            sort_by = "case_sensitive",

            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
        })
    end,
}

