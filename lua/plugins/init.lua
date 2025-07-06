vim.o.sessionoptions = vim.o.sessionoptions .. ",localoptions" 

return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require("configs.conform"),
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lspconfig")
        end,
    },
    -- GitHub Copilot
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = true, auto_trigger = true },
                panel = { enabled = true },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end,
    },

    -- Harpoon: file bookmarking
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Git UI inside Neovim
    {
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Fancy notifications
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("configs.cmp")
        end,
    },

    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "error",
                auto_session_enable_last_session = true,
                auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
                auto_session_enabled = true,
                auto_save_enabled = true,
                auto_restore_enabled = true,
            })
        end,
    },

    {
        "rmagatti/auto-session",
        lazy = false,
        config = function()
            require("auto-session").setup({
                log_level = "info",
                auto_session_enabled = true,
                auto_save_enabled = true,
                auto_restore_enabled = true,
                auto_session_use_git_branch = true,
                session_lens = { load_on_setup = false },
            })
        end,
    },

    -- test new blink
    -- { import = "nvchad.blink.lazyspec" },

    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },
}
