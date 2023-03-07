local status, harpoon = pcall(require, "harpoon")
if (not status) then return end

harpoon.setup({
    -- menu = {
    --     width = vim.api.nvim_win_get_width(0) - 4,
    -- }
})

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<space>fm", mark.add_file)
vim.keymap.set("n", "<space>fe", ui.toggle_quick_menu)

vim.keymap.set("n", "<space>fh", function() ui.nav_file(1) end)
vim.keymap.set("n", "<space>fj", function() ui.nav_file(2) end)
vim.keymap.set("n", "<space>fk", function() ui.nav_file(3) end)
vim.keymap.set("n", "<space>fl", function() ui.nav_file(4) end)