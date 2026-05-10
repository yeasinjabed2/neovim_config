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
    },

    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
