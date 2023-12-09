local keymap = vim.keymap.set

-- Undotree
keymap("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Increment/decrement
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- Change macro key
keymap("n", "Q", "q")

-- Disabled recording macro key
keymap("n", "q", "<Nop>")

-- Escape and clear hlsearch
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
keymap({ "i", "n" }, "<C-c>", "<cmd>noh<cr><esc>")

-- Exit
keymap("i", "<C-c>", "<esc>")

-- Search word under cursor
keymap({ "n", "x" }, "gw", "*N")

-- Next search result
keymap({"n", "x", "o"}, "n", "'Nn'[v:searchforward]")

-- Prev search result
keymap({"n", "x", "o"}, "n", "'nN'[v:searchforward]")

-- Save file
keymap({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>")

-- File Explorer NETRW
keymap("n", "<leader>ee", "<cmd>Ex<cr>")

-- Close buffer
keymap("n", "<leader>qw", "<cmd>bd<cr>")
-- keymap("n", "<leader>qwf", "<cmd>bd!<cr>")

-- GitSigns git blame
keymap("n", "gb", "<cmd>Gitsigns blame_line<cr>")

-- Source NVIM config
keymap("n", "<leader>sc", "<cmd>source ~/.config/nvim/init.lua<cr>")

-- Open NVIM config
keymap("n", "<leader>en", "<cmd>Telescope find_files cwd=~/.config/nvim<cr>")

-- Open Kitty config
keymap("n", "<leader>ek", "<cmd>Telescope find_files cwd=~/.config/kitty<cr>")

-- Open zshrc
keymap("n", "<leader>eb", "<cmd>Telescope find_files cwd=~/.zshrc<cr>")
