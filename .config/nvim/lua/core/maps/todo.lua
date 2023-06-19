local keymap = vim.keymap.set
local opts = { silent = true }

-- Todo
keymap("n", "<leader>tt", "<cmd>TodoTelescope<cr>", opts)