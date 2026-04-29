return {
    "rmagatti/auto-session",
    lazy = false,
    priority = 1000,
    config = function()
        require("auto-session").setup({
            auto_restore_enabled = true,
            auto_save_enabled = true,
            auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/tmp" },
            auto_session_use_git_branch = true,
            auto_session_allowed_dirs = nil,
            bypass_session_save_file_types = {},
            close_unsupported_windows = true,
            args_allow_single_directory = true,
            session_lens = {
                buftypes_to_ignore = {},
                days_interval = 1,
                previewer = false,
                prompt_title = "Search Sessions",
            },
            post_cwd_changed_cmds = { "NvimTreeRefresh" },
            cwd_change_handling = {
                restore_upcoming_session = true,
                pre_cwd_changed_hook = nil,
                post_cwd_changed_hook = function()
                    require("lualine").refresh()
                end,
            },
            log_level = "error",
            use_git_branch = true,
        })

        local function restore_session()
            vim.api.nvim_create_autocmd("VimEnter", {
                callback = function()
                    if vim.fn.argc() == 0 then
                        require("auto-session").RestoreSession()
                    end
                end,
                once = true,
            })
        end

        restore_session()
    end,
}
