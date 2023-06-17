-- local keymap = vim.keymap
local map = vim.api.nvim_set_keymap
local opts = {
    noremap = true,
    silent = true,
}

-- Dotfiles
map('n', '<leader>en', '<cmd>lua require"plovinicius.telescope.mappings".edit_neovim()<cr>', opts)
map('n', '<leader>ez', '<cmd>lua require"plovinicius.telescope.mappings".edit_zsh()<cr>', opts)

-- Search
map('n', '<space>gw', '<cmd>lua require"plovinicius.telescope.mappings".grep_string()<CR>', opts)

-- Files
map('n', '<leader>fg', '<cmd>lua require"plovinicius.telescope.mappings".git_files()<cr>', opts)
map('n', '<leader>fd', '<cmd>lua require"plovinicius.telescope.mappings".find_files()<cr>', opts)
map('n', '<leader>fe', '<cmd>lua require"plovinicius.telescope.mappings".file_browser()<cr>', opts)
map('n', '<leader>lg', '<cmd>lua require"plovinicius.telescope.mappings".live_grep()<cr>', opts)

-- Nvim
map('n', '<leader>fo', '<cmd>lua require"plovinicius.telescope.mappings".buffers()<cr>', opts)
map('n', '<leader>fs', '<cmd>lua require"plovinicius.telescope.mappings".curbuf()<cr>', opts)
map('n', '<space>vo', '<cmd>lua require"plovinicius.telescope.mappings".vim_options()<cr>', opts)
map('n', '<space>ts', '<cmd>lua require"plovinicius.telescope.mappings".treesitter()<cr>', opts)

-- LSP
map('n', 'gi', '<cmd>lua require"plovinicius.telescope.mappings".lsp_implementations<CR>', opts)
map('n', "gr", '<cmd>lua require"plovinicius.telescope.mappings".lsp_references()<CR>', opts)

-- Git
map('n', '<leader>gc', '<cmd>lua require"plovinicius.telescope.mappings".git_commits()<cr>', opts)
map('n', '<leader>gs', '<cmd>lua require"plovinicius.telescope.mappings".git_status()<cr>', opts)
