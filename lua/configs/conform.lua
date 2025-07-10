local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        css = { "prettier" },
        html = { "prettier" },
        javascript = { "eslint_d", "prettier" },
        javascriptreact = { "eslint_d", "prettier" },
        typescript = { "eslint_d", "prettier" },
        typescriptreact = { "eslint_d", "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        yaml = { "prettier" },
        python = { "black" },
        go = { "gofumpt" },
        rust = { "rustfmt" },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 1000,
        lsp_fallback = true,
    },
}

return options
