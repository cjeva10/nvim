vim.pack.add({
    { src = "https://github.com/saghen/blink.cmp" }
})

require("blink.cmp").setup({
    keymap = {
        ["<C-e>"] = { "cancel", "fallback" },
    },
    completion = {
        list = {
            selection = {
                preselect = false,
            },
        },
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
})
