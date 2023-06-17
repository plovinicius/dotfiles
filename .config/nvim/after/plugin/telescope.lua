local telescope_status, telescope = pcall(require, "telescope")
local fzf_status, fzf = pcall(require, "telescope-fzf-native")
if (not telescope_status or not fzf_status) then return end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
    defaults = {
        prompt_prefix = " >",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        path_display = { "truncate" },
        file_ignore_patterns = { "node_modules", "vendor", "public/css", "public/js", ".git" },
        -- winblend = 0,
        -- scroll_strategy = "cycle",
        -- color_devicons = true,
        layout_config = {
            horizontal = {
                prompt_position = "bottom",
                preview_width = 0.55,
                -- preview_width = function(_, cols, _)
                --     if cols > 200 then
                --         return math.floor(cols * 0.4)
                --     else
                --         return math.floor(cols * 0.6)
                --     end
                -- end,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 80,
        },

        mappings = {
            -- TODO: check actions to map here
            n = {
                ["q"] = actions.close
            },
        },
    },
    pickers = {
        find_files = {
            -- I don't like having the cwd prefix in my files
            find_command = { "fdfind", "--strip-cwd-prefix", "--type", "f" },

            mappings = {
                n = {
                    ["kj"] = "close",
                },
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        },

        fzf_writer = {
            use_highlighter = false,
            minimum_grep_characters = 6,
        },

        hop = {
            -- keys define your hop keys in order; defaults to roughly lower- and uppercased home row
            keys = { "a", "s", "d", "f", "g", "h", "j", "k", "l", ";" }, -- ... and more

            -- Highlight groups to link to signs and lines; the below configuration refers to demo
            -- sign_hl typically only defines foreground to possibly be combined with line_hl
            sign_hl = { "WarningMsg", "Title" },

            -- optional, typically a table of two highlight groups that are alternated between
            line_hl = { "CursorLine", "Normal" },

            -- options specific to `hop_loop`
            -- true temporarily disables Telescope selection highlighting
            clear_selection_hl = false,
            -- highlight hopped to entry with telescope selection highlight
            -- note: mutually exclusive with `clear_selection_hl`
            trace_entry = true,
            -- jump to entry where hoop loop was started from
            reset_selection = true,
        },
    }
}

telescope.load_extension("fzf")
telescope.load_extension("file_browser")
