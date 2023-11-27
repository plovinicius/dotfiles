local status, telescope = pcall(require, "telescope")
if (not status) then return end

local keymap = vim.keymap.set
local builtin = require('telescope.builtin')

keymap("n", "<leader>sf", builtin.find_files)
keymap("n", "<leader>fs", builtin.current_buffer_fuzzy_find)
keymap("n", "<leader>fe", builtin.buffers)
keymap("n", "<leader>gf", builtin.git_files)
keymap("n", "<leader>sh", builtin.help_tags)
keymap("n", "<leader>sw", builtin.grep_string)
keymap("n", "<leader>sg", builtin.live_grep)
-- keymap("n", "<leader>sd", builtin.diagnostics)
keymap("n", "<leader>sr", builtin.resume)
