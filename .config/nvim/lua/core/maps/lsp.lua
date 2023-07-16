local keymap = vim.keymap.set
local opts = { silent = true }

-- Code action
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
-- keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)

-- Declaration
keymap("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)

-- Implementation
keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)

-- Rename all references
-- keymap("n", "<leader>re", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
keymap("n", "<leader>re", "<cmd>Lspsaga rename<cr>", opts)

-- Format
keymap("n", "<leader>fl", "<cmd>lua vim.lsp.buf.format()<cr>", opts)

-- Hover Doc
-- keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)