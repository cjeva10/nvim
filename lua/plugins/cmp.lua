return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = "1.8.0",
    opts = {
        keymap = {
            ["<C-e>"] = { "cancel", "fallback" },
            ["<CR>"] = {"accept", "fallback" },
        },
        completion = {
            menu = {
                draw = {
                    columns = {
                        { "kind_icon", gap = 1 },
                        { "label",     "label_description", gap = 1 },
                        { "source_id" },
                    },
                },
            },
        },
        fuzzy = {
            implementation = "prefer_rust_with_warning",
        },
    },
    opts_extend = { "sources.default" }
}
