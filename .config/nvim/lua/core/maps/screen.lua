local keymap = vim.keymap.set

-- Close current buffer
keymap("n", "<leader>q", "<cmd>:bw<cr>")

-- Other window
keymap("n", "<leader>ww", "<C-W>p", { remap = true })

-- Delete window
keymap("n", "<leader>wq", "<C-W>c", { remap = true })

-- Split window
keymap("n", "<leader>s-", ":split<Return><C-w>w")
keymap("n", "<leader>s=", ":vsplit<Return><C-w>w")
keymap("n", "<leader>sq", ":close<CR>")

-- Movement between windows
keymap({"n", "t"}, "<C-h>", "<C-w>h")
keymap({"n", "t"}, "<C-k>", "<C-w>k")
keymap({"n", "t"}, "<C-j>", "<C-w>j")
keymap({"n", "t"}, "<C-l>", "<C-w>l")

-- Resize windows
keymap("n", "<C-Up>", "<cmd>resize +2<cr>")
keymap("n", "<C-Down>", "<cmd>resize -2<cr>")
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>")