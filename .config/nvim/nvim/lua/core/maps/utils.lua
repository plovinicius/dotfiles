local keymap = vim.keymap.set

-- Increment/decrement
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- Select all
keymap("n", "<C-a>", "gg<S-v>G")

-- Disabled recording macro key
keymap("n", "q", "<Nop>")

-- Escape and clear hlsearch
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

-- Exit
keymap("i", "<C-c>", "<esc>")

-- Search word under cursor
keymap({ "n", "x" }, "gw", "*N")

-- Next search result
keymap({"n", "x", "o"}, "n", "'Nn'[v:searchforward]")
-- keymap("x", "n", "'Nn'[v:searchforward]")
-- keymap("o", "n", "'Nn'[v:searchforward]")

-- Prev search result
keymap({"n", "x", "o"}, "n", "'nN'[v:searchforward]")
-- keymap("x", "N", "'nN'[v:searchforward]")
-- keymap("o", "N", "'nN'[v:searchforward]")

-- Save file
keymap({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>")

-- Force Quit all
keymap("n", "<leader>qq", "<cmd>qa!<cr>")

-- Neo tree
-- keymap("n", "<leader>e", "<cmd>Neotree action=focus toggle=true reveal=true<cr>")

-- File Explorer NETRW
-- keymap("n", "<leader>e", "<cmd>Explore<cr>")

-- Reload NVIM config
-- keymap("n", "<leader>rn", "<cmd>so ~/.config/nvim/init.lua<cr>")