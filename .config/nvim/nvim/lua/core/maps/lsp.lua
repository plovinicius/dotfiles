local keymap = vim.keymap.set
local opts = { silent = true }

-- Code action
-- keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)

-- Declaration
keymap("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)

-- Line Diagnostics
keymap("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float", opts)

-- Rename all references
keymap("n", "<leader>re", "<cmd>Lspsaga rename<cr>", opts)

-- Format
keymap("n", "<leader>ff", "<cmd>lua vim.lsp.buf.format()<cr>", opts)

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)

-- References
keymap("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)

-- Definitions
keymap("n", "gd", "<cmd>Telescope lsp_definitions reuse_win=true<cr>", opts)

-- Implementation
keymap("n", "gI", "<cmd>Telescope lsp_implementations reuse_win=true<cr>", opts)