-- Build hooks for plugins that need a compile/install step on install or update.
-- Must be registered before any vim.pack.add call so the first install fires it.
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local data = ev.data
        if data.kind ~= "install" and data.kind ~= "update" then
            return
        end
        if data.spec.name == "telescope-fzf-native.nvim" then
            local obj = vim.system({ "make" }, { cwd = data.path }):wait()
            if obj.code ~= 0 then
                vim.notify(
                    "telescope-fzf-native build failed: " .. (obj.stderr or ""),
                    vim.log.levels.ERROR
                )
            end
        end
    end,
})

-- Load colorscheme first so subsequent plugin UI picks up the theme.
require("plugins.colorscheme")
require("plugins.oil")
require("plugins.lspconfig")
require("plugins.telescope")
require("plugins.gitsigns")
require("plugins.comment")
require("plugins.cmp")
require("plugins.treesitter")
