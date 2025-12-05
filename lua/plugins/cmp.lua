return {
    'saghen/blink.cmp',
    version = "1.8.0",
    opts = {
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
    },
}
