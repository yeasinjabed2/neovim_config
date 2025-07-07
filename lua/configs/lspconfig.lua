require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

-- -- diagnostic config
-- vim.diagnostic.config({
--   virtual_text = true,
--   float = { border = "rounded" },
-- })
--
-- read :h vim.lsp.config for changing options of lsp servers
