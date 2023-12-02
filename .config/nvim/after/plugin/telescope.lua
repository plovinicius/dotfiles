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

-- function to get width based on screen size
local get_width = function(_, cols, _)
  if cols > 200 then
    return 170
  else
    return math.floor(cols * 0.9)
  end
end

local dropdown_layout = function(title)
  return {
    prompt_title = title,
    theme = "dropdown",
    preview = false,
    layout_config = {
      width = get_width,
      height = 0.4,
      prompt_position = "top",
    }
  }
end

local grep_layout = function(title)
  return {
    prompt_title = title,
    only_sort_text = true,
    preview = true,
    layout_config = {
      width = get_width,
      height = 0.75,
      preview_width = 0.5,
      preview_cutoff = 120,
    }
  }
end

local references_layout = function(title)
  return {
    prompt_title = title,
    show_line = false,
    preview = true,
    layout_config = {
      width = get_width,
      height = 0.75,
      preview_width = 0.5,
      preview_cutoff = 120,
    }
  }
end

telescope.setup {
  defaults = {
    preview = false,
    buffer_previewer_maker = new_maker,
    prompt_prefix = "",
    vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    dynamic_preview_title = true,
    winblend = 0,
    file_ignore_patterns = {
      "node_modules",
      "vendor",
      "public/css",
      "public/js",
      ".git/",
      "package-lock.json"
    },
    path_display = { "truncate" },
    initial_mode = "insert",
    select_strategy = "reset",
    sorting_strategy = "ascending",
    mappings = {
      i = {
        ["<C-c>"] = "close",
        ["<Tab>"] = "move_selection_next",
        ["<C-j>"] = "move_selection_next",
        ["<S-Tab>"] = "move_selection_previous",
        ["<C-k>"] = "move_selection_previous",
        ["<C-d>"] = "delete_buffer",
      }
    }
  },
  pickers = {
    find_files = dropdown_layout("Search Files"),
    git_files = dropdown_layout("Search git files"),
    buffers = dropdown_layout("Find existing buffers"),
    live_grep = grep_layout("Search by grep"),
    grep_string = grep_layout("Search current word"),
    lsp_references = references_layout("Goto References"),
    lsp_definitions = references_layout("Goto Definitions"),
    current_buffer_fuzzy_find = {
      prompt_title = "Fuzzily search in current buffer"
    },
    help_tags = {
      prompt_title = "Search help"
    },
    diagnostics = {
      prompt_title = "Search Diagnostics"
    },
    resume = {
      prompt_title = "Search Resume"
    },
    lsp_implementations = {
      prompt_title = "Goto Implementations"
    },
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
