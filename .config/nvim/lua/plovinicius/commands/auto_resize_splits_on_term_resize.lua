-- resize neovim split when terminal is resized
vim.api.nvim_command("autocmd VimResized * wincmd =")
