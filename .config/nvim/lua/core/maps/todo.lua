local keymap = vim.keymap.set
local opts = { silent = true }

-- Todo
keymap("n", "<leader>td", "<cmd>TodoTelescope<cr>", opts)