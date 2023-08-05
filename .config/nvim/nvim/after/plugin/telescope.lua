local status, telescope = pcall(require, "telescope")
if (not status) then return end

-- dont preview binaries
local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end
  }):sync()
end

local dropdown_layout = {
  theme = "dropdown",
  preview = false,
  layout_config = {
    width = 0.5,
    height = 0.4,
    prompt_position = "top",
    preview_cutoff = 120,
  },
}

local grep_layout = {
  only_sort_text = true,
  preview = false,
  layout_config = {
    width = 0.9,
    height = 0.75,
    preview_width = 0.6,
  }
}

local references_layout = {
  show_line = false,
  preview = true,
  layout_config = {
    width = 0.9,
    height = 0.75,
    preview_width = 0.6,
  }
}

telescope.setup {
  defaults = {
    preview = false,
    buffer_previewer_maker = new_maker,
    prompt_prefix = "",
    file_ignore_patterns = {
      "node_modules",
      "vendor",
      "public/css",
      "public/js",
      ".git",
      "package-lock.json"
    },
    initial_mode = "insert",
    select_strategy = "reset",
    sorting_strategy = "ascending",
    mappings = {
      i = {
        ["<C-c>"] = "close",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
      n = {
        ["<C-c>"] = "close",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      }
    }
  },
  pickers = {
    find_files = dropdown_layout,
    git_files = dropdown_layout,
    buffers = dropdown_layout,
    live_grep = grep_layout,
    grep_string = grep_layout,
    lsp_references = references_layout
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({
        previewer        = false,
        initial_mode     = "normal",
        sorting_strategy = 'ascending',
        layout_strategy  = 'horizontal',
        layout_config    = {
          horizontal = {
            width = 0.5,
            height = 0.4,
            preview_width = 0.6,
          },
        },
      })
    },
    file_browser = {
      hidden = {
        file_browser = true,
        folder_browser = true
      },
    }
  }
}

telescope.load_extension('fzf')
telescope.load_extension('ui-select')
telescope.load_extension('file_browser')