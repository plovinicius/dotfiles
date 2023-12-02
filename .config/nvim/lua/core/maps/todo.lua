local keymap = vim.keymap.set
local opts = { silent = true }

-- Todo
keymap("n", "<leader>tl", "<cmd>TodoTelescope<cr>", opts)
