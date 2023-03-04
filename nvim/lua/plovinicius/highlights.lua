vim.opt.cursorline = true -- TODO: check this
vim.opt.termguicolors = true
vim.opt.winblend = 0 -- TODO: check this
vim.opt.wildoptions = 'pum' -- TODO: check this
vim.opt.pumblend = 5 -- TODO: check this
vim.opt.background = 'dark'

-- Work with indent-blankline plugin
-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

-- TODO: check which yank command will kepp
-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]]

-- Highlight on yank
-- local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   callback = function()
--     vim.highlight.on_yank()
--   end,
--   group = highlight_group,
--   pattern = '*',
-- })