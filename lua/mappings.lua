require("nvchad.mappings")
-- add yours here

local map = vim.keymap.set
local harpoon = require("harpoon")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Move selected lines up or down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line(s) down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line(s) up" })

--GitHub Copilot Mappings (Insert Mode)
map("i", "<C-l>", function()
    require("copilot.suggestion").accept()
end, { desc = "Copilot Accept Suggestion" })

map("i", "<C-]>", function()
    require("copilot.suggestion").next()
end, { desc = "Copilot Next Suggestion" })

map("i", "<C-[>", function()
    require("copilot.suggestion").prev()
end, { desc = "Copilot Previous Suggestion" })

map("i", "<C-\\>", function()
    require("copilot.suggestion").dismiss()
end, { desc = "Copilot Dismiss Suggestion" })

-- Git signs (line blame, stage hunk, etc.)
map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Git Blame Line" })
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Git Stage Hunk" })
map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Git Undo Stage Hunk" })
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "Git Diff This" })

-- Lazygit
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit UI" })

-- Add current file to Harpoon list
map("n", "<leader>ha", function()
    harpoon:list():add()
end, { desc = "Harpoon Add File" })

-- Open Harpoon UI menu
map("n", "<leader>hh", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon Menu" })

-- Quick jump to files 1-5
map("n", "<leader>h1", function()
    harpoon:list():select(1)
end, { desc = "Harpoon File 1" })
map("n", "<leader>h2", function()
    harpoon:list():select(2)
end, { desc = "Harpoon File 2" })
map("n", "<leader>h3", function()
    harpoon:list():select(3)
end, { desc = "Harpoon File 3" })
map("n", "<leader>h4", function()
    harpoon:list():select(4)
end, { desc = "Harpoon File 4" })
map("n", "<leader>h5", function()
    harpoon:list():select(5)
end, { desc = "Harpoon File 5" })

-- Auto Session Management
map("n", "<leader>ss", ":SessionSave<CR>", { desc = "Save Session" })
map("n", "<leader>sl", ":SessionLoad<CR>", { desc = "Load Session" })
map("n", "<leader>sd", ":SessionDelete<CR>", { desc = "Delete Session" })

-- new commit
