local keymap = vim.keymap.set

-- Close current buffer
keymap("n", "<leader>.", "<cmd>:bw<CR>")

-- Tab management
-- keymap("n", "<leader>to", ":tabnew<CR>")
-- keymap("n", "<leader>t.", ":tabclose<CR>")
-- keymap("n", "<leader>tn", ":tabn<CR>")
-- keymap("n", "<leader>tp", ":tabp<CR>")

-- Split window
-- keymap("n", "<leader>s-", ":split<Return><C-w>w")
-- keymap("n", "<leader>s=", ":vsplit<Return><C-w>w")
-- keymap("n", "<leader>se", "<C-w>=")
-- keymap("n", "<leader>s.", ":close<CR>")

-- Move window
-- keymap("n", "sf", "<C-w>w")
-- keymap(", "sh", "<C-w>h")
-- keymap(", "sk", "<C-w>k")
-- keymap(", "sj", "<C-w>j")
-- keymap(", "sl", "<C-w>l")

-- Resize window
-- keymap("n", "<C-w><left>", "<C-w><")
-- keymap("n", "<C-w><right>", "<C-w>>")
-- keymap("n", "<C-w><up>", "<C-w>+")
-- keymap("n", "<C-w><down>", "<C-w>-")