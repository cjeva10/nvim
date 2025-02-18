-- find more here: https://www.nerdfonts.com/cheat-sheet

local M = {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "windwp/nvim-autopairs",
    },
    config = function()
        local cmp_status_ok, cmp = pcall(require, "cmp")
        if not cmp_status_ok then
            return {}
        end

        local snip_status_ok, luasnip = pcall(require, "luasnip")
        if not snip_status_ok then
            return {}
        end

        require("luasnip/loaders/from_vscode").lazy_load()

        -- If you want insert `(` after select function or method item
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )

        --   פּ ﯟ   some other good icons
        local kind_icons = {
            Text = "󰊄",
            Method = "m",
            Function = "󰡱",
            Constructor = "",
            Field = "",
            Variable = "󰫧",
            Class = "",
            Interface = "",
            Module = "",
            Property = "",
            Unit = "",
            Value = "v",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
            Copilot = "",
        }
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = {
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm(),
                ["<C-Space>"] = cmp.mapping.complete(),
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[NVIM_LUA]",
                        copilot = "[copilot]",
                        luasnip = "[Snippet]",
                        buffer = "[Buffer]",
                        path = "[Path]",
                    })[entry.source.name]
                    return vim_item
                end,
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "nvim_lua" },
                { name = "copilot" },
                { name = "luasnip" },
                { name = "path" },
            },
        })
    end,
}

return M
