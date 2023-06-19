local keymap = vim.keymap.set
local opts = { silent = true }

-- References
-- keymap("n", "<leader>lR", "<cmd>Telescope lsp_references<cr>", opts)

-- Diagnostics
keymap("n", "<leader>lw", "<cmd>Telescope diagnostics<cr>", opts)

-- Refactor
keymap("n", "<leader>lt", "[[ <Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>]]", opts)

-- Find Files
keymap("n", "<leader>sf", "<cmd>Telescope find_files<cr>", opts)

-- Find Help
-- keymap("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", opts)

-- Man Pages
-- keymap("n", "<leader>sM", "<cmd>Telescope man_pages<cr>", opts)

-- Live Grep
keymap("n", "<leader>st", "<cmd>Telescope live_grep<cr>", opts)

-- Commands
-- keymap("n", "<leader>sC", "<cmd>Telescope commands<cr>", opts)

-- Buffers
keymap("n", "<leader>bf", "<cmd>Telescope buffers previewer=false<cr>", opts)