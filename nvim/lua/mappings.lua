local themes = require "telescope.themes"
local M = {}

function M.builtin()
  require("telescope.builtin").builtin()
end

function M.git_files()
  local path = vim.fn.expand "%:h"
  if path == "" then
    path = nil
  end

  local opts = {
    previewer = false,
    cwd = path,
  }

  require("telescope.builtin").git_files(opts)
end

function M.buffers()
  require("telescope.builtin").buffers()
end

function M.grep_string()
  local opts = {
    search = vim.fn.input("Grep for > ")
  }

  require("telescope.builtin").grep_string(opts)
end

function M.grep_word()
  local opts = {
    search = vim.fn.input("<cword>")
  }

  require("telescope.builtin").grep_string(opts)
end

function M.curbuf()
  local opts = {
    previewer = false
  }
  require("telescope.builtin").current_buffer_fuzzy_find(opts)
end

function M.help_tags()
  require("telescope.builtin").help_tags {
    show_version = true,
  }
end

function M.search_all_files()
  require("telescope.builtin").find_files {
    -- find_command = { "rg", "--no-ignore", "--files" },
    previewer = false
  }
end

function M.git_worktree()
  require("telescope").extensions.git_worktree.git_worktrees()
end

function M.lsp_references()
  require("telescope.builtin").lsp_references()
end

function M.file_browser()
  local opts

  opts = {
    previewer = false
  }

  require("telescope").extensions.file_browser.file_browser(opts)
end

function M.git_status()
  local opts = {
    previewer = false,
  }

  require("telescope.builtin").git_status(opts)
end

function M.git_commits()
  require("telescope.builtin").git_commits {
    winblend = 5,
  }
end

function M.git_branches()
  local path = vim.fn.expand "%:h"
  if path == "" then
    path = nil
  end

  local opts = {
    previewer = false,
    cwd = path,
    attach_mappings = function(_, map)
      map("i", "<c-d>", require("telescope.builtin").git_delete_branch)
   	  map("n", "<c-d>", require("telescope.builtin").git_delete_branch)
	  return true
	end,
  }

  require("telescope.builtin").git_branches(opts)
end

return M
