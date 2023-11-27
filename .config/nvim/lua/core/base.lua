vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.g.mapleader = " "

vim.opt.clipboard:append { 'unnamedplus' }

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.colorcolumn = "120"
vim.opt.nu = true

-- default is menu,preview
vim.o.completeopt = 'menuone,noselect'
vim.o.updatetime = 50

-- Disable netrw
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrw = 1

-- Netrw config when enabled
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 25
vim.g.netrw_localcopydircmd = 'cp -r'

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.signcolumn = "yes"
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
-- vim.opt.shell = 'fish'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { 
  '*/node_modules/*, */vendor/*'
}

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
