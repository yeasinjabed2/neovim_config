require("nvchad.configs.lspconfig").defaults()

local nvlsp = require("nvchad.configs.lspconfig")
local util = require("lspconfig.util")

-- HTML
vim.lsp.config("html", {
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.capabilities,
})

-- CSS
vim.lsp.config("cssls", {
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.capabilities,
})

-- Dart / Flutter
vim.lsp.config("dartls", {
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.capabilities,
    root_dir = util.root_pattern("pubspec.yaml", ".git"),
})

-- Enable servers
vim.lsp.enable({ "html", "cssls", "dartls" })
