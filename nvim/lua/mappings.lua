-- local themes = require "telescope.themes"
local M = {}
local action_state = require "telescope.actions.state"

function M.builtin()
  require("telescope.builtin").builtin()
end

function M.git_files()
  -- local path = vim.fn.expand "%:h"
  -- if path == "" then
  --   path = nil
  -- end

  local opts = {
    previewer = true,
    -- cwd = path,
  }

  require("telescope.builtin").git_files(opts)
end

function M.buffers()
  require("telescope.builtin").buffers()
end

function M.grep_string()
  -- local opts = {
  --   search = vim.fn.input("Grep for > ")
  -- }

  require("telescope.builtin").grep_string()
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
    find_command = { "rg", "--no-ignore", "--files" },
  }
end

function M.find_files()
  require("telescope.builtin").find_files {
    previewer = true
  }
end

function M.project_search()
  require("telescope.builtin").find_files {
    previewer = false,
    layout_strategy = "vertical",
    cwd = require("nvim_lsp.util").root_pattern ".git"(vim.fn.expand "%:p"),
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
    sorting_strategy = "ascending",
    scroll_strategy = "cycle",
    layout_config = {
      prompt_position = "top",
    },

    attach_mappings = function(prompt_bufnr, map)
      local current_picker = action_state.get_current_picker(prompt_bufnr)

      local modify_cwd = function(new_cwd)
        local finder = current_picker.finder

        finder.path = new_cwd
        finder.files = true
        current_picker:refresh(false, { reset_prompt = true })
      end

      map("i", "-", function()
        modify_cwd(current_picker.cwd .. "/..")
      end)

      map("i", "~", function()
        modify_cwd(vim.fn.expand "~")
      end)

      map("n", "yy", function()
        local entry = action_state.get_selected_entry()
        vim.fn.setreg("+", entry.value)
      end)

      return true
    end,
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
