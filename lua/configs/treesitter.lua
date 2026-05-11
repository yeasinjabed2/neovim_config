local options = {
  ensure_installed = {
    "bash",
    "lua",
    "luadoc",
    "markdown",
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
    "dart",
  },

  highlight = {
    enable = true,
  },

  indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
