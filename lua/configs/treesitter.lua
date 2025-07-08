local options = {
    ensure_installed = {
        "bash",
        "fish",
        "lua",
        "luadoc",
        "markdown",
        "printf",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
        "tsx",
        "vue",
        "javascript",
        "typescript",
        "json",
        "html",
        "css",
        "python",
        "rust",
        "dart",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
    autotag = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
