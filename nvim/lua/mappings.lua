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

  local width = 0.75
  -- if path and string.find(path, "sourcegraph.*sourcegraph", 1, false) then
  --   width = 0.5
  -- end

  local opts = themes.get_dropdown {
    winblend = 5,
    previewer = false,
    shorten_path = false,

    cwd = path,

    layout_config = {
      width = width,
    },
  }

  require("telescope.builtin").git_files(opts)
end

-- function M.buffer_git_files()
--   require("telescope.builtin").git_files(themes.get_dropdown {
--     cwd = vim.fn.expand "%:p:h",
--     previewer = false,
--   })
-- end

function M.live_grep()
  local path = vim.fn.expand "%:h"
  if path == "" then
    path = nil
  end

  local opts = {
    previewer = false,
    fzf_separator = "|>",
    cwd = path,
  }

  require("telescope.builtin").live_grep(opts)
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
    previewer = false
  }
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
  require("telescope.builtin").git_branches({
		attach_mappings = function(_, map)
			map("i", "<c-d>", require("telescope.builtin").git_delete_branch)
			map("n", "<c-d>", require("telescope.builtin").git_delete_branch)
			return true
		end,
	})
end

return M
