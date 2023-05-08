return {
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                allFeatures = true,
                overrideCommand = {
                    'cargo',
                    'cargo-watch',
                    'clippy',
                    '--workspace',
                    '--message-format=json',
                    '--all-targets',
                    '--all-features'
                }
            }
        }
    }
}
