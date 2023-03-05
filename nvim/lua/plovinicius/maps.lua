local keymap = vim.keymap
-- TODO: check this, should I change for keymap.set and remove opts?
local opts = { noremap=true, silent=true }
local map = vim.api.nvim_set_keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards -- TODO: check this
-- keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Delete character but not put in the undo buffer
keymap.set('n', 'x', '"_x')

-- Remove highlighted texts front /<word>
keymap.set('n', '<leader>nh', ':nohl<CR>')

-- Tab management
keymap.set('n', '<leader>to', ':tabnew<CR>')
keymap.set('n', '<leader>t.', ':tabclose<CR>')
keymap.set('n', '<leader>tn', ':tabn<CR>')
keymap.set('n', '<leader>tp', ':tabp<CR>')

-- Split window
keymap.set('n', '<leader>s-', ':split<Return><C-w>w')
keymap.set('n', '<leader>s=', ':vsplit<Return><C-w>w')
keymap.set('n', '<leader>se', '<C-w>=')
keymap.set('n', '<leader>s.', ':close<CR>')

-- vim-maximizer
keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>')

-- Move window
-- keymap.set('n', 'sf', '<C-w>w')
-- keymap.set('', 'sh', '<C-w>h')
-- keymap.set('', 'sk', '<C-w>k')
-- keymap.set('', 'sj', '<C-w>j')
-- keymap.set('', 'sl', '<C-w>l')

-- Resize window
-- keymap.set('n', '<C-w><left>', '<C-w><')
-- keymap.set('n', '<C-w><right>', '<C-w>>')
-- keymap.set('n', '<C-w><up>', '<C-w>+')
-- keymap.set('n', '<C-w><down>', '<C-w>-')


-- ////////////
-- Old ones
-- ///////////


-- Ex mode
map('n', '<space>em', '<cmd>Ex<CR>', opts)

-- Keeping it centered
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)
map('n', 'Y', 'yg$', opts)
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)
map('n', 'J', 'mzJ`z', opts)

-- Disabled recording macro key
map('n', 'q', '<Nop>', opts)

-- Close current buffer
map('n', '<leader>.', '<cmd>:bw<CR>', opts)

-- Keeps current visual block selection after indent with '<' or '>'
map('v', '>', '>gv', opts)
map('v', '<', '<gv', opts)

-- Move line
-- map('n', '<C-k>', 'ddkP', opts)
-- map('n', '<C-j>', 'ddp', opts)

-- Move text up and down on visual mode
map("v", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", opts)
map("x", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", opts)
map("v", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", opts)
map("x", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", opts)

-- Exit
map('i', '<C-c>', '<esc>', opts)

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

-- php-cs-fixer
-- map("n", "<leader>pcd", "<cmd>call PhpCsFixerFixDirectory()<cr>", opts)
-- map("n", "<leader>pcf", "<cmd>call PhpCsFixerFixFile()<cr>", opts)

require("plovinicius.telescope.keys")
