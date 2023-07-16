local keymap = vim.keymap.set

-- Close current buffer
keymap("n", "<leader>q", "<cmd>:bw<cr>")

-- Tab management
-- keymap("n", "<leader>to", ":tabnew<CR>")
-- keymap("n", "<leader>t.", ":tabclose<CR>")
-- keymap("n", "<leader>tn", ":tabn<CR>")
-- keymap("n", "<leader>tp", ":tabp<CR>")

-- Split window
keymap("n", "<leader>s-", ":split<Return><C-w>w")
keymap("n", "<leader>s=", ":vsplit<Return><C-w>w")
keymap("n", "<leader>sq", ":close<CR>")

-- Move window
keymap("n", "<leader>sf", "<C-w>w")
keymap("n", "<leader>sh", "<C-w>h")
keymap("n", "<leader>sk", "<C-w>k")
keymap("n", "<leader>sj", "<C-w>j")
keymap("n", "<leader>sl", "<C-w>l")

-- Resize window
keymap("n", "<leader><right>", "<C-w><")
keymap("n", "<leader><left>", "<C-w>>")
keymap("n", "<leader><up>", "<C-w>+")
keymap("n", "<leader><down>", "<C-w>-")