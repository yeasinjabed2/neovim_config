local ok, lualine = pcall(require, "lualine")
if not ok then
  return
end

local function lsp_clients()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if not clients or #clients == 0 then
    return "No LSP"
  end
  local names = {}
  for _, client in ipairs(clients) do
    if client and client.name then
      names[#names + 1] = client.name
    end
  end
  return table.concat(names, ",")
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { statusline = { "alpha", "NvimTree", "lazy", "dashboard" } },
    globalstatus = true,
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { { "mode", icon = "", color = function()
        local mode_color = {
          n = { fg = "#ffffff", bg = "#61317d" },  -- Normal: white text, dodger blue bg
          i = { fg = "#ffffff", bg = "#359c5c" },  -- Insert: white text, green bg
          v = { fg = "#ffffff", bg = "#ab2b91" },  -- Visual: white text, pink bg
          V = { fg = "#ffffff", bg = "#ab2b91" },
          c = { fg = "#000000", bg = "#f74548" },  -- Command: black text, yellow bg
          s = { fg = "#ffffff", bg = "#bd93f9" },  -- Select: white text, purple bg
          S = { fg = "#ffffff", bg = "#bd93f9" },
          [""] = { fg = "#ffffff", bg = "#bd93f9" },
          R = { fg = "#ffffff", bg = "#ff6b6b" },  -- Replace: white text, red bg
          r = { fg = "#ffffff", bg = "#ff6b6b" },
          ["!"] = { fg = "#ffffff", bg = "#8be9fd" },  -- Shell: white text, cyan bg
          t = { fg = "#ffffff", bg = "#f75414" },  -- Terminal: white text, cyan bg
        }
        return mode_color[vim.fn.mode()] or {}
    end } },
    lualine_b = { { "branch", icon = "" }, "diff" },
    lualine_c = {
      { "filename", path = 1, symbols = { modified = " ●", readonly = " ", unnamed = "[No Name]" } },
      "filesize",
    },
    lualine_x = {
      { "diagnostics", sources = { "nvim_diagnostic" }, sections = { "error", "warn", "info", "hint" } },
      { lsp_clients, icon = "" },
      { "filetype", icon_only = false },
    },
    lualine_y = { "fileformat" },
    lualine_z = { "progress", "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { "nvim-tree", "quickfix", "fugitive", "lazy", "mason" },
})
