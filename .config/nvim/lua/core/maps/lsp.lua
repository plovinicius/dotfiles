local keymap = vim.keymap.set
local opts = { silent = true }

keymap("n", "M", "<cmd>Lspsaga code_action<cr>", opts)
keymap("x", "M", "<cmd><C-u>Lspsaga range_code_action<cr>", opts)
keymap("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float", opts)
keymap("n", "<leader>re", "<cmd>Lspsaga rename<cr>", opts)
keymap("n", "<leader>ff", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
keymap("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
keymap("n", "gd", "<cmd>Lspsaga peek_definition<cr>", opts)
keymap("n", "gD", "<cmd>Telescope lsp_definitions reuse_win=true<cr>", opts)
keymap("n", "gI", "<cmd>Telescope lsp_implementations reuse_win=true<cr>", opts)
keymap("n", "<leader>sd", function() vim.diagnostic.open_float() end, opts)
