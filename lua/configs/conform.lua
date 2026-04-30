local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        -- Web
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        graphql = { "prettier" },
        -- Python
        python = { "black", "isort" },
        -- Rust
        rust = { "rustfmt" },
        -- C/C++
        c = { "clang-format" },
        cpp = { "clang-format" },
        -- Go
        go = { "gofmt" },
        -- Java
        java = { "google-java-format" },
        -- Kotlin
        kotlin = { "ktlint" },
        -- C#
        cs = { "csharpier" },
        -- PHP
        php = { "php-cs-fixer" },
        -- Ruby
        ruby = { "rubocop" },
        -- Lua
        lua = { "stylua" },
        -- Shell
        sh = { "shfmt" },
        bash = { "shfmt" },
        -- SQL
        sql = { "sqlfluff" },
        -- Dockerfile
        dockerfile = { "hadolint" },
        -- TOML
        toml = { "taplo" },
        -- XML
        xml = { "xmllint" },
    },
    formatters = {
        prettier = {
            stdin = true,
        },
        black = {
            prepend_args = { "--line-length=88" },
        },
        isort = {
            prepend_args = { "--profile", "black" },
        },
        rustfmt = {
            prepend_args = { "--edition", "2021" },
        },
        clang_format = {
            prepend_args = { "--style=file" },
        },
        gofmt = {},
        shfmt = {
            prepend_args = { "-i", "2" },
        },
        sqlfluff = {
            prepend_args = { "format", "--dialect", "postgres" },
        },
        stylua = {
            prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
    },
})

-- Auto format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        conform.format({ bufnr = args.buf, lsp_fallback = true })
    end,
})

-- ~/.config/prettier/.prettierrc.json
--
-- {
--   "semi": true,
--   "trailingComma": "es5",
--   "singleQuote": true,
--   "printWidth": 80,
--   "tabWidth": 2,
--   "useTabs": false,
--   "arrowParens": "always",
--   "bracketSpacing": true,
--   "jsxBracketSameLine": false,
--   "jsxSingleQuote": false,
--   "quoteProps": "as-needed",
--   "proseWrap": "preserve",
--   "endOfLine": "lf"
-- }


-- # Web
-- npm install -g prettier
--
-- # Python
-- pip install black isort
--
-- # Rust
-- rustup component add rustfmt
--
-- # C/C++
-- sudo apt install clang-format  # Ubuntu/Debian
--
-- # Go
-- go install github.com/golang/tools/cmd/goimports@latest
--
-- # Java
-- npm install -g google-java-format
--
-- # Kotlin
-- npm install -g ktlint
--
-- # C#
-- dotnet tool install -g csharpier
--
-- # PHP
-- composer global require friendsofphp/php-cs-fixer
--
-- # Ruby
-- gem install rubocop
--
-- # Lua
-- cargo install stylua
--
-- # Shell
-- sudo apt install shfmt  # Ubuntu/Debian
--
-- # SQL
-- pip install sqlfluff
--
-- # TOML
-- cargo install taplo-cli
-- ```
--
-- Each project can have its own config files (`.prettierrc.json`, `pyproject.toml`, `rustfmt.toml`, `.clang-format`, etc.) and conform will auto-discover them.
--
