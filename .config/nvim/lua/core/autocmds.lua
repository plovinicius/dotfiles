local api = vim.api

local colors = {
  fg = "#76787d",
  bg = "#252829",
}

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- go to last loc when opening a buffer
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })

-- Enable spell checking for certain file types
api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  -- { pattern = { "*.txt", "*.md", "*.tex" }, command = [[setlocal spell<cr> setlocal spelllang=en,de<cr>]] }
  {
    pattern = { "*.txt", "*.md", "*.tex" },
    callback = function()
      vim.opt.spell = true
      vim.opt.spelllang = "en,de"
    end,
  }
)

-- change the background color of floating windows and borders.
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.cmd("highlight NormalFloat guibg=none guifg=none")
    vim.cmd("highlight FloatBorder guifg=" .. colors.fg .. " guibg=none")
    vim.cmd("highlight NormalNC guibg=none guifg=none")
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- resize neovim split when terminal is resized
vim.api.nvim_command("autocmd VimResized * wincmd =")

-- netrw custom keymap
api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  desc = 'Better mappings for netrw',
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
    end 

    -- Help
    bind('?', '<F1>')

    -- Close preview window
    bind('P', '<C-w>z')
  end
})

-- Open Telescope on startup if the first argument is a directory
-- local ts_group = vim.api.nvim_create_augroup("TelescopeOnEnter", { clear = true })
-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
--     callback = function()
--         local first_arg = vim.v.argv[3]
--         if first_arg and vim.fn.isdirectory(first_arg) == 1 then
--             -- Vim creates a buffer for folder. Close it.
--             vim.cmd(":bd 1")
--             require("telescope.builtin").find_files({ search_dirs = { first_arg } })
--         end
--     end,
--     group = ts_group,
-- })