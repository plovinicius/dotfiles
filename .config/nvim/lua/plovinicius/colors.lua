-- vim.cmd([[colorscheme nightfox]])
vim.cmd([[colorscheme tokyonight]])
-- vim.cmd([[colorscheme tokyonight-storm]])

vim.api.nvim_set_hl(0, "SignColumn", {
    bg = "none"
})

-- Limit line colors
vim.api.nvim_set_hl(0, "ColorColumn", {
    ctermbg = 0,
    bg = "#555555"
})

vim.api.nvim_set_hl(0, "CursorLineNR", {
    bg = "none"
})

-- All terminal colors
vim.api.nvim_set_hl(0, "Normal", {
    bg = "none"
})

-- Numbers color
vim.api.nvim_set_hl(0, "LineNr", {
    fg = "#68E9B0",
})

vim.api.nvim_set_hl(0, "LineNrAbove", {
    fg = "#5eacd3",
})

vim.api.nvim_set_hl(0, "LineNrBelow", {
    fg = "#5eacd3",
})

vim.api.nvim_set_hl(0, "netrwDir", {
    fg = "#5eacd3"
})