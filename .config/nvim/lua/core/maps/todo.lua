local keymap = vim.keymap.set
local opts = { silent = true }

-- Todo
keymap("n", "<leader>st", "<cmd>TodoTelescope<cr>", opts)