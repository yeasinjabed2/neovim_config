require("nvchad.options")

local o = vim.o

-- Indenting
o.shiftwidth = 2 -- number of spaces to use for each step of (auto)indent
o.tabstop = 2 -- number of spaces that a <Tab> counts for
o.softtabstop = 2 -- number of spaces to use for each step of (auto)indent

o.relativenumber = true -- enable relative line numbers
o.number = true -- enable line numbers

o.mouse = "" -- disable mouse support
o.scrolloff = 0 -- disable scrolloff
o.undolevels = 1000 -- number of undolevels to keep

-- give all usefull options for better productivity
-- o.clipboard = "unnamedplus" -- use system clipboard
-- o.completeopt = "menu,menuone,noselect" -- completion options
-- o.showmode = false -- disable showing mode in command line
-- o.showtabline = 2 -- always show tabline
-- o.splitbelow = true -- open new split below
-- o.splitright = true -- open new split to the right
-- o.termguicolors = true -- enable true colors
-- o.timeoutlen = 500 -- time to wait for a mapped sequence to completeopt
-- o.updatetime = 300 -- time to wait before triggering CursorHold event
-- o.hidden = true -- allow switching buffers without saving
-- o.wrap = false -- disable line wrapping
-- o.backup = false -- disable backup files
-- o.writebackup = false -- disable write backup files
-- o.swapfile = false -- disable swap files
-- o.undofile = true -- enable persistent undofile
