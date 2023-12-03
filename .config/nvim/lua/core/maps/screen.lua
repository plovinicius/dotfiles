local keymap = vim.keymap.set

-- Split window
keymap("n", "<A-S-Enter>", ":split<Return><C-w>w")
keymap("n", "<A-Enter>", ":vsplit<Return><C-w>w")
keymap("n", "<A-BS>", ":close<CR>")

-- Movement between windows
keymap({"n"}, "<C-h>", "<cmd>KittyNavigateLeft<cr>")
keymap({"n"}, "<C-k>", "<cmd>KittyNavigateUp<cr>")
keymap({"n"}, "<C-j>", "<cmd>KittyNavigateDown<cr>")
keymap({"n"}, "<C-l>", "<cmd>KittyNavigateRight<cr>")
-- keymap({"n", "t"}, "<C-h>", "<C-w>h")
-- keymap({"n", "t"}, "<C-k>", "<C-w>k")
-- keymap({"n", "t"}, "<C-j>", "<C-w>j")
-- keymap({"n", "t"}, "<C-l>", "<C-w>l")

-- Resize windows
keymap("n", "<C-Up>", "<cmd>resize +2<cr>")
keymap("n", "<C-Down>", "<cmd>resize -2<cr>")
keymap("n", "<C-Left>", "<cmd>vertical resize +2<cr>")
keymap("n", "<C-Right>", "<cmd>vertical resize -2<cr>")
