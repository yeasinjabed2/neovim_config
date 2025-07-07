return {
    on_attach = function(client, bufnr)
        if client.name == "tsserver" then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.code_action({
                        context = { only = { "source.addMissingImports.ts" }, diagnostics = {} },
                        apply = true,
                    })
                end,
            })
        end
    end,
}
