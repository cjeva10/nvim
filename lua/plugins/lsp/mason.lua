local servers = {
    "cssls",
    "html",
    "luau_lsp",
    "lua_ls",
    "pyright",
    "jsonls",
    "rust_analyzer",
    "quick_lint_js",
    "jdtls",
    "tsserver",
    "tailwindcss",
    "clangd",
    "gopls",
    "sqlls",
    "ruff",
    "solidity",
}

local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
    -- fix offset_encoding warning with clangd
    local capabilities = require("plugins.lsp.handlers").capabilities
    if server == "clangd" then
        capabilities.offsetEncoding = { "utf-16" }
    end

    opts = {
        on_attach = require("plugins.lsp.handlers").on_attach,
        capabilities = capabilities,
    }
    server = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    lspconfig[server].setup(opts)
end
