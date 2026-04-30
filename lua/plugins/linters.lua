return {
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require("lint")
            
            lint.linters_by_ft = {
                javascript = { "eslint_d" },
                typescript = { "eslint_d" },
                typescriptreact = { "eslint_d" },
                javascriptreact = { "eslint_d" },
                python = { "ruff" },
                lua = { "luacheck" },
                sh = { "shellcheck" },
            }

            -- Automatically lint on save and other events
            vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    },
}
