vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.g.mapleader = " "

-- default is 50%
-- vim.g.netrw_winsize = 25

-- vim.api.nvim_set_option('clipboard', 'unnamedplus')

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.colorcolumn = "80"
-- vim.wo.signcolumn = 'yes'
vim.opt.nu = true

-- default is menu,preview
vim.o.completeopt = 'menuone,noselect'

vim.o.updatetime = 50

-- vim.opt.undofile = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
-- vim.opt.shell = 'fish' -- TODO: check this
-- vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' } -- TODO: check this
-- vim.opt.inccommand = 'split' -- TODO: check this

-- TODO: check this ? vim.o.ignorecase = true
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true

-- TODO: check this ? vim.o.shiftwidth
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false -- No Wrap lines
-- vim.opt.backspace = { 'start', 'eol', 'indent' } -- TODO: check this

-- TODO: check this
-- vim.opt.path:append { '**' } -- Finding files - Search down into subfolders

-- TODO: check this
vim.opt.wildignore:append { 
  '*/node_modules/*,*/vendor/*'
}

-- Undercurl -- TODO: check this
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments -- TODO: check this
vim.opt.formatoptions:append { 'r' }

local function status_line()
  -- local mode = "%-5{%v:lua.string.upper(v:lua.vim.fn.mode())%}"
  local file_name = "%-.16t"
  -- local buf_nr = "[%n]"
  local modified = " %-m"
  -- local file_type = " %y"
  local right_align = "%="
  local line_no = "%10([%l/%L%)]"
  -- local pct_thru_file = "%5p%%"

  return string.format(
    " %s%s%s",
    -- mode,
    file_name,
    -- buf_nr,
    modified,
    -- file_type,
    right_align,
    line_no
    -- pct_thru_file
  )
end

vim.opt.winbar = status_line()
