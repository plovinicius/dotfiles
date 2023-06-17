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

vim.keymap.set("n", "<space>f1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<space>f2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<space>f3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<space>f4", function() ui.nav_file(4) end)
