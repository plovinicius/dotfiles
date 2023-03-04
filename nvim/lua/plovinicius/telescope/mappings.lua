local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local themes = require("telescope.themes")
local builtin = require("telescope.builtin")

local M = {}

-- Edit NeoVim config file
function M.edit_neovim()
    local opts_with_preview, opts_without_preview
  
    opts_with_preview = {
        prompt_title = "~ dotfiles ~",
        shorten_path = false,
        cwd = "~/.config/nvim",
  
        layout_strategy = "flex",
        layout_config = {
            width = 0.9,
            height = 0.8,
    
            horizontal = {
                width = { padding = 0.15 },
            },
            vertical = {
                preview_height = 0.75,
            },
        },
        attach_mappings = function(_, map)
            map("i", "<c-y>", set_prompt_to_entry_value)
            map("i", "<M-c>", function(prompt_bufnr)
            actions.close(prompt_bufnr)
            vim.schedule(function()
                builtin.find_files(opts_without_preview)
            end)
            end)
    
            return true
        end,
    }
  
    opts_without_preview = vim.deepcopy(opts_with_preview)
    opts_without_preview.previewer = false
  
    builtin.find_files(opts_with_preview)
end

-- Edit ZSH config file
function M.edit_zsh()
    builtin.find_files {
      shorten_path = false,
      cwd = "~/.config/zsh/",
      prompt = "~ dotfiles ~",
      hidden = true,
  
      layout_strategy = "horizontal",
      layout_config = {
            preview_width = 0.55,
      },
    }
end

-- Find within git files
function M.git_files()
    local path = vim.fn.expand "%:h"
    
    if path == "" then
        path = nil
    end

    local opts = themes.get_dropdown {
        winblend = 5,
        previewer = false,
        shorten_path = false,
    
        cwd = path,
    
        layout_config = {
          width = width,
        },
    }

    builtin.git_files(opts)
end

-- List buffers
function M.buffers()
    builtin.buffers()
end

-- Grep string
function M.grep_string()
    builtin.grep_string {
        word_match = "-w",
        short_path = true,
        only_sort_text = true,
        layout_strategy = "vertical",
    }
end

-- Grep string on prompt
function M.grep_prompt()
    builtin.grep_string {
        path_display = { "shorten" },
        search = vim.fn.input "Grep String > ",
    }
end

-- Find within current buffer
function M.curbuf()
    local opts = themes.get_dropdown {
        winblend = 10,
        border = true,
        previewer = false,
        shorten_path = false,
    }

    builtin.current_buffer_fuzzy_find(opts)
end

-- Find files
function M.find_files()
    builtin.find_files()
end

-- Search by string
function M.live_grep()
    builtin.live_grep {
        previewer = false,
        fzf_separator = "|>",
    }
end

-- Search for references
function M.lsp_references()
    builtin.lsp_references {
        layout_strategy = "vertical",
        layout_config = {
            prompt_position = "top",
        },
        sorting_strategy = "ascending",
        ignore_filename = false,
    }
end

-- Search for implementations
function M.lsp_implementations()
    builtin.lsp_implementations {
        layout_strategy = "vertical",
        layout_config = {
            prompt_position = "top",
        },
        sorting_strategy = "ascending",
        ignore_filename = false,  
    }
end

-- Search within file tree
function M.file_browser()
    local opts

    opts = {
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
        layout_config = {
            prompt_position = "top",
        },

        -- attach_mappings = function(prompt_bufnr, map)
        --     local current_picker = action_state.get_current_picker(prompt_bufnr)

        --     local modify_cwd = function(new_cwd)
        --         local finder = current_picker.finder

        --         finder.path = new_cwd
        --         finder.files = true
        --         current_picker:refresh(false, { reset_prompt = true })
        --     end

        --     map("i", "-", function()
        --         modify_cwd(current_picker.cwd .. "/..")
        --     end)

        --     map("i", "~", function()
        --         modify_cwd(vim.fn.expand "~")
        --     end)

        --     map("n", "yy", function()
        --         local entry = action_state.get_selected_entry()
        --         vim.fn.setreg("+", entry.value)
        --     end)

        --     return true
        -- end,
    }

    require("telescope").extensions.file_browser.file_browser(opts)
end

-- Git status
function M.git_status()
    local opts = themes.get_dropdown {
        winblend = 10,
        border = true,
        previewer = false,
        shorten_path = false,
    }

    builtin.git_status(opts)
end

-- Git commits
function M.git_commits()
    builtin.git_commits {
        winblend = 5,
    }
end

-- Find within vim options
function M.vim_options()
    builtin.vim_options {
        layout_config = {
            width = 0.5,
        },
        sorting_strategy = "ascending",
    }
end

-- Find functions, names, variables
function M.treesitter()
    builtin.treesitter()
end

return M
