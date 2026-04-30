local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
    group = "YankHighlight",
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- Auto-format on save
augroup("AutoFormat", { clear = true })
autocmd("BufWritePre", {
    group = "AutoFormat",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

-- Create missing parent directories
augroup("AutoCreateDir", { clear = true })
autocmd("BufWritePre", {
    group = "AutoCreateDir",
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- LSP group
local lsp_group = augroup("LSP", { clear = true })

autocmd("BufWritePost", {
    group = lsp_group,
    callback = function()
        pcall(function()
            require("lint").try_lint()
        end)
    end,
})

autocmd("LspAttach", {
    group = lsp_group,
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
        end
    end,
})
