local keymap = vim.keymap.set

-- Increment/decrement
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- Select all
keymap("n", "<C-a>", "gg<S-v>G")

-- Remove highlighted texts front /<word>
keymap("n", "<leader>h", ":nohl<CR>")

-- Disabled recording macro key
keymap("n", "q", "<Nop>")

-- Exit
keymap("i", "<C-c>", "<esc>")

-- Neo tree
keymap("n", "<leader>e", "<cmd>NeoTreeFocusToggle<cr>")