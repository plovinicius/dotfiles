local keymap = vim.keymap.set
local opts = { silent = true }

-- keymap("n", "gd", "<cmd>Lspsaga lsp_finder<cr>", opts)
-- keymap("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)

-- Code action
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
-- keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)

-- Definition
keymap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)

-- Delcaration
keymap("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)

-- Implementation
keymap("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)

-- Rename all references
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

-- Format
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", opts)

-- Hover Doc
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
-- keymap("n", "K", "<Cmd>Lspsaga hover_doc<cr>", opts)