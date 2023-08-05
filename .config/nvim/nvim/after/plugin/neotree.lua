local status, neotree = pcall(require, "neo-tree.")
if (not status) then return end

neotree.setup {
    enable_git_status = false,
    window = {
        width = 35,
    },
    filesystem = {
        -- use_libuv_file_watcher = true,
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
                "node_modules",
            },
            never_show = {
                ".DS_Store",
                "thumbs.db",
            },
        },
    }
}