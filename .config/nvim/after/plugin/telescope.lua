local status, telescope = pcall(require, "telescope")
if (not status) then return end

telescope.setup {
  defaults = {
    previewer = false,
    -- hidden = true,
    prompt_prefix = "  ",
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
    -- layout_strategy = "horizontal",
    -- layout_config = {
    --   width = 0.5,
    --   height = 0.4,
    --   prompt_position = "top",
    --   preview_cutoff = 120,
    -- },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
      layout_config = {
        --   width = 0.5,
        --   height = 0.4,
        prompt_position = "top",
        --   preview_cutoff = 120,
      },
    },
    git_files = {
      previewer = false,
      theme = "dropdown",
      layout_config = {
        --   width = 0.5,
        --   height = 0.4,
        prompt_position = "top",
        --   preview_cutoff = 120,
      },
    },
    buffers = {
      previewer = false,
      theme = "dropdown",
      layout_config = {
        width = 0.5,
        height = 0.4,
        prompt_position = "top",
        preview_cutoff = 120,
      },
    },
    live_grep = {
      only_sort_text = true,
      previewer = true,
      layout_config = {
        horizontal = {
          width = 0.9,
          height = 0.75,
          preview_width = 0.6,
        },
      },
    },
    grep_string = {
      only_sort_text = true,
      previewer = true,
      layout_config = {
        horizontal = {
          width = 0.9,
          height = 0.75,
          preview_width = 0.6,
        },
      },
    },
    lsp_references = {
      show_line = false,
      previewer = true,
      layout_config = {
        horizontal = {
          width = 0.9,
          height = 0.75,
          preview_width = 0.6,
        },
      },
    },
    treesitter = {
      show_line = false,
      previewer = true,
      layout_config = {
        horizontal = {
          width = 0.9,
          height = 0.75,
          preview_width = 0.6,
        },
      },
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
  }
}

telescope.load_extension('fzf')
telescope.load_extension('ui-select')
telescope.load_extension('refactoring')