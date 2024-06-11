return {
  "vim-test/vim-test",
  vim.keymap.set('n', '<leader>tt', '<cmd>TestNearest<cr>'),
  vim.keymap.set('n', '<leader>tf', '<cmd>TestFile<cr>'),
  vim.keymap.set('n', '<leader>ta', '<cmd>TestSuite<cr>'),
  vim.keymap.set('n', '<leader>tl', '<cmd>TestLast<cr>'),
  vim.cmd("let test#strategy = 'kitty'")
}
