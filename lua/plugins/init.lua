local plugins = {
    -- Core plugins
    { "nvim-lua/plenary.nvim", lazy = true },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "folke/lazy.nvim",
        tag = "stable",
    },

    -- Theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },

    -- UI Enhancements
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        priority = 100,
        config = function()
            require("configs.nvim_tree")
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("configs.lualine")
        end,
    },

    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            require("configs.alpha")
        end,
    },

    -- Import standalone plugin files
    { import = "plugins.auto-session" },
    { import = "plugins.autotag" },
    { import = "plugins.copilot-chat" },
    { import = "plugins.lazygit" },
    { import = "plugins.linters" },
    -- { import = "plugins.lualine" },
    -- LSP Setup
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("configs.lspconfig")
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            require("configs.treesitter")
        end,
    },

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            require("configs.cmp")
        end,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
        },
    },

    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
    },

    -- Formatting
    {
        "stevearc/conform.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("configs.conform")
        end,
    },

    -- Linters
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("plugins.linters")
        end,
    },

    -- Auto-tag
    {
        "windwp/nvim-ts-autotag",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("plugins.autotag")
        end,
    },

    -- Avante AI
    {
        "yetone/avante.nvim",
        build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            or "make",
        event = "VeryLazy",
        version = false,
        opts = {
            instructions_file = "avante.md",
            provider = "copilot",
            input = { provider = "snacks" },
            selector = { provider = "snacks" },
            providers = {
                copilot = {
                    model = "gpt-4.1",
                    timeout = 30000,
                },
                claude = {
                    endpoint = "https://api.anthropic.com",
                    model = "claude-sonnet-4-20250514",
                    timeout = 30000,
                    extra_request_body = {
                        temperature = 0.75,
                        max_tokens = 20480,
                    },
                },
                moonshot = {
                    endpoint = "https://api.moonshot.ai/v1",
                    model = "kimi-k2-0711-preview",
                    timeout = 30000,
                    extra_request_body = {
                        temperature = 0.75,
                        max_tokens = 32768,
                    },
                },
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-mini/mini.pick",
            "nvim-telescope/telescope.nvim",
            "hrsh7th/nvim-cmp",
            "ibhagwan/fzf-lua",
            "stevearc/dressing.nvim",
            "folke/snacks.nvim",
            "nvim-tree/nvim-web-devicons",
            "zbirenbaum/copilot.lua",
            {
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        use_absolute_path = true,
                    },
                },
            },
            {
                "MeanderingProgrammer/render-markdown.nvim",
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },

    -- Copilot
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = true, auto_trigger = true },
                panel = { enabled = false },
                filetypes = {
                    ["*"] = true,
                    gitcommit = true,
                }
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

    -- Snacks (dependency for avante)
    {
        "folke/snacks.nvim",
        lazy = true,
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Undotree
    {
        "mbbill/undotree",
        event = "VeryLazy",
    },

    -- Better diagnostics
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        event = "VeryLazy",
        config = function()
            require("lsp_lines").setup()
        end,
    },

    -- Git signs (shows changes in gutter)
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "▎" },
                    change = { text = "▎" },
                    delete = { text = "▎" },
                    topdelete = { text = "▎" },
                    changedelete = { text = "▎" },
                },
            })
        end,
    },
}

return plugins
