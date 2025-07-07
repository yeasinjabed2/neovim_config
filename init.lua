vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
    },

    { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("options")
require("autocmds")

vim.schedule(function()
    require("mappings")
end)

-- Git commit diff injection
-- In cmd > git config --global core.editor "nvim"
vim.api.nvim_create_autocmd("FileType", {
    pattern = "gitcommit",
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local diff = vim.fn.systemlist("git diff --cached")
        if not diff or #diff == 0 then
            return
        end

        -- Convert diff to comments
        local comment_lines = vim.tbl_map(function(line)
            return "# " .. line
        end, diff)

        -- Inject the diff as comments
        vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, comment_lines)

        -- Add a visual separator
        table.insert(comment_lines, "# ---------------------")
        vim.api.nvim_buf_set_lines(bufnr, #comment_lines, #comment_lines, false, { "" })

        -- Place cursor after the separator
        vim.api.nvim_win_set_cursor(0, { #comment_lines + 1, 0 })

        -- Trigger Copilot suggestion
        vim.schedule(function()
            vim.cmd("startinsert")
            -- simulate typing a space to trigger Copilot
            local ks = vim.api.nvim_replace_termcodes(" ", true, false, true)
            vim.api.nvim_feedkeys(ks, "i", true)
        end)
    end,
})

-- Clear ConformInfo log
vim.api.nvim_create_user_command("ClearConformInfo", function()
    local conform_log_path = vim.fn.stdpath("cache") .. "/conform.log"
    if vim.fn.filereadable(conform_log_path) == 1 then
        vim.fn.writefile({}, conform_log_path)
        print("ConformInfo log cleared.")
    else
        print("ConformInfo log file does not exist.")
    end
end, { desc = "Clear ConformInfo log" })
