return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main", -- or "main"
    dependencies = {
        "zbirenbaum/copilot.lua", -- already in your setup
        "nvim-lua/plenary.nvim",
    },
    opts = {
        show_help = true,
        auto_follow_cursor = true,
        debug = false,
    },
    keys = {
        {
            "<leader>cc",
            function()
                require("CopilotChat").ask("Fix this code")
            end,
            mode = "v",
            desc = "Copilot Chat: Fix selected code",
        },
        {
            "<leader>ca",
            function()
                require("CopilotChat").open()
            end,
            mode = "v",
            desc = "Copilot Chat: Ask Copilot (selected code)",
        },
    },
}
