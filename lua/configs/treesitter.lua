local parsers = {
  "bash",
  "lua",
  "luadoc",
  "markdown",
  "markdown_inline",
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
}

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

-- The plugin lazy-loads on BufReadPost/BufNewFile, so FileType has already
-- fired for the buffer that triggered loading. Start TS for it manually.
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.api.nvim_buf_is_loaded(buf) then
    pcall(vim.treesitter.start, buf)
  end
end
