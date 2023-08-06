local keymap = vim.keymap.set

-- better up/down
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Delete character but not put in the undo buffer
keymap("n", "x", '"_x')

-- Keeping it centered
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "Y", "yg$")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "J", "mzJ`z")

-- Keeps current visual block selection after indent with "<" or ">"
keymap("v", ">", ">gv")
keymap("v", "<", "<gv")

-- Move line
keymap("n", "<C-k>", "ddkP")
keymap("n", "<C-j>", "ddp")

-- Move to end and beginning of the line
keymap({"n", "v"}, "H", "^")
keymap({"n", "v"}, "L", "$")

-- Move text up and down on visual mode
keymap({"v", "x"}, "<A-j>", "<Esc><cmd>m .+1<CR>gv")
keymap({"v", "x"}, "<A-k>", "<Esc><cmd>m .-2<CR>gv")