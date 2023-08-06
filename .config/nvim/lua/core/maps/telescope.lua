local keymap = vim.keymap.set
local opts = { silent = true }

-- Find Files
keymap("n", "<leader>fd", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)

-- Current buffer fuzzy find
keymap("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)

-- Live Grep
keymap("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", opts)

-- Buffers
keymap("n", "<leader>fe", "<cmd>Telescope buffers previewer=false<cr>", opts)

-- File Explorer/Brower
keymap("n", "<leader>e", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", opts)