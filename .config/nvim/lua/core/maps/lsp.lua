local keymap = vim.keymap.set
local opts = { silent = true }

keymap("n", "<C-.>", "<cmd>Lspsaga code_action<cr>", opts)
keymap("n", "<D-.>", "<cmd>Lspsaga code_action<cr>", opts)
keymap("n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
keymap("n", "<leader>fl", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
keymap("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
keymap("n", "gd", "<cmd>Telescope lsp_definitions reuse_win=true<cr>", opts)
keymap("n", "gi", "<cmd>Telescope lsp_implementations reuse_win=true<cr>", opts)
