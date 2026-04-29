local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local opts = { noremap = true, silent = true }

-- Auto-session group
local auto_session_group = augroup("AutoSession", { clear = true })

autocmd("VimLeave", {
    group = auto_session_group,
    callback = function()
        pcall(function()
            require("auto-session").SaveSession()
        end)
    end,
})

autocmd("VimEnter", {
    group = auto_session_group,
    callback = function()
        if vim.fn.argc() == 0 and not vim.g.started_with_args then
            vim.schedule(function()
                pcall(function()
                    require("auto-session").RestoreSession()
                end)
            end)
        end
    end,
    once = true,
})

-- Highlight group
local highlight_group = augroup("Highlight", { clear = true })

autocmd("TextYankPost", {
    group = highlight_group,
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- Formatting group
local format_group = augroup("Format", { clear = true })

autocmd("BufWritePre", {
    group = format_group,
    callback = function()
        require("conform").format({ async = false, lsp_fallback = true })
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
