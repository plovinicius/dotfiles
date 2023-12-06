local keymap = vim.keymap.set

-- better up/down
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- empty line up/down
keymap("n", "<Enter>", "o<Esc>")
keymap("n", "<S-Enter>", "O<Esc>")

-- Delete character but not put in the undo buffer
keymap("n", "x", '"_x')
keymap({"n", "v", "x"}, "d", '"_d')
keymap({"n", "v", "x"}, "D", '"_D')

-- Keeping it centered
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "Y", "yg$")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "J", "mzJ`z")

-- For MacOS
keymap("n", "<D-d>", "<C-d>zz")
keymap("n", "<D-u>", "<C-u>zz")

-- Keeps current visual block selection after indent with "<" or ">"
keymap("v", ">", ">gv")
keymap("v", "<", "<gv")

-- Move line
keymap("n", "<A-k>", "ddkP")
keymap("n", "<A-j>", "ddp")

-- Move to end and beginning of the line
keymap({"n", "v"}, "H", "^")
keymap({"n", "v"}, "L", "$")

-- Move text up and down on visual mode
keymap({"v", "x"}, "<A-j>", "<Esc><cmd>m .+1<CR>gv")
keymap({"v", "x"}, "<A-k>", "<Esc><cmd>m .-2<CR>gv")
