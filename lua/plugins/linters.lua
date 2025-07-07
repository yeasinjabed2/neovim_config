return {
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("lint").linters_by_ft = {
                javascript = { "eslint_d" },
                typescript = { "eslint_d" },
                typescriptreact = { "eslint_d" },
                javascriptreact = { "eslint_d" },
                python = { "flake8" },
                lua = { "luacheck" },
                sh = { "shellcheck" },
            }

            -- Automatically lint on save
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
}
