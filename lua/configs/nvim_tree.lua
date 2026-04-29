require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
        side = "left",
        preserve_window_proportions = true,
    },
    renderer = {
        group_empty = true,
        full_name = false,
        root_folder_label = false,
        indent_width = 2,
        indent_markers = {
            enable = true,
            inline_arrows = true,
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
        },
    },
    filters = {
        dotfiles = false,
        custom = { "^.git$" },
    },
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    git = {
        enable = true,
        ignore = false,
    },
})
