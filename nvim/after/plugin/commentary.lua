local status_commentary, commentary = pcall(require, "cmp")
local status_comment, comment = pcall(require, "nvim-ts-context-commentstring")
if (not status_commentary or not status_comment) then return end

vim.api.nvim_set_keymap('n', '<space>/', [[v:lua.context_commentstring.update_commentstring_and_run('Commentary')]], opts)
vim.api.nvim_set_keymap('x', '<space>/', [[v:lua.context_commentstring.update_commentstring_and_run('Commentary')]], opts)
vim.api.nvim_set_keymap('o', '<space>/', [[v:lua.context_commentstring.update_commentstring_and_run('Commentary')]], opts)
vim.api.nvim_set_keymap('n', '<space>/', [[v:lua.context_commentstring.update_commentstring_and_run('CommentaryLine')]], opts)
