local keymap = vim.keymap.set
local opts = { silent = true }

-- References
keymap("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", opts)

-- Definitions
keymap("n", "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", opts)

-- Diagnostics
keymap("n", "<leader>cd", "<cmd>Telescope diagnostics<cr>", opts)

-- Refactor
-- keymap("n", "<leader>lt", "[[ <Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>]]", opts)

-- Find Files
keymap("n", "<leader>fd", "<cmd>Telescope find_files<cr>", opts)

-- Current buffer fuzzy find
keymap("n", "<leader>ff", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)

-- Find Help
-- keymap("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", opts)

-- Live Grep
keymap("n", "<leader>fs", "<cmd>Telescope grep_string<cr>", opts)

-- Buffers
keymap("n", "<leader>fe", "<cmd>Telescope buffers previewer=false<cr>", opts)