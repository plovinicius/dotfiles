-- #######################
-- Packer and plugins
-- #######################

local execute = vim.api.nvim_command

local fn = vim.fn

-- Ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute('packadd packer.nvim')
end

vim.cmd('packadd packer.nvim')

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager

    -- Telescope Requirements
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- Color scheme
    use { "ellisonleao/gruvbox.nvim" }
    use "EdenEast/nightfox.nvim"
    use "folke/tokyonight.nvim"

    --File browsing
    use 'nvim-telescope/telescope-file-browser.nvim'

    -- Telescope
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Harpoon
    -- use 'ThePrimeagen/harpoon'

    -- Git WorkTree
    use 'ThePrimeagen/git-worktree.nvim'

    -- TODO Comments
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require"todo-comments".setup{}
      end
    }

    -- Indent Blankline
    use 'lukas-reineke/indent-blankline.nvim'

    -- Git Signs
    use {
      'lewis6991/gitsigns.nvim',
      requires = 'nvim-lua/plenary.nvim'
    }

    -- LSP autocomplete
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'williamboman/nvim-lsp-installer'

    -- Prettier

    -- Editing
    use 'tpope/vim-surround'

    -- Bufferline/tabs
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

    -- Comment
    -- use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
    use 'tpope/vim-commentary'
    use 'JoosepAlviste/nvim-ts-context-commentstring' --add comment to ts, js files

    -- Tree-Sitter for language highlight
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- Vim polyglot
    use 'sheerun/vim-polyglot'

    -- Status bar
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- LSP performant UI
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")

            saga.setup()
        end,
    })

    -- File Explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
end)


-- #######################
-- Options
-- #######################

-- set map leader
vim.g.mapleader = " "

-- netrw config
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
-- vim.g.netrw_liststyle = 3

--Set highlight on search
vim.o.hlsearch = false

--Clipboard
-- vim.api.nvim_set_option('clipboard', 'unnamedplus')

-- Disable swapfile
vim.opt.swapfile = false

-- Disable file backup
vim.opt.backup = false

-- Ignore node modules
vim.opt.wildignore:append { '*/node_modules/*' }

--Make line numbers default
vim.wo.number = true
vim.opt.nu = true

--Scroll with some lines
vim.opt.scrolloff = 8

--Show relative line number
vim.wo.relativenumber = true

--Show color column
vim.wo.colorcolumn = "80"

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
-- vim.o.ignorecase = true
-- vim.o.smartcase = true

-- Give more space for displaying messages.
-- vim.opt.cmdheight = 1

-- Dont wrap lines
vim.opt.wrap = false

--Decrease update time
vim.o.updatetime = 50
vim.wo.signcolumn = 'yes'

--Set colorscheme
vim.o.termguicolors = true
vim.opt.background = "dark" -- or "light" for light mode

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- doing vim.o.tabstop does not work. tabstop only works as a buffer option when trying to set with meta accessors
-- ideally, i guess they should be set per buffer depending on the type of file
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
-- don't want case sensitive searches
vim.o.ignorecase = true
-- but still want search to be smart. If i type a upper case thing, do a case
-- sensitive blah

-- #######################
-- Nightfox color scheme setup
-- #######################

require('nightfox').setup({
    options = {
        transparent= true
    }
})

require('tokyonight').setup({
    style = "night",
    transparent = "true",
    on_colors = function(colors)
        colors.errors = "#ff0000"
    end
})

-- vim.cmd([[colorscheme nightfox]])
vim.cmd([[colorscheme tokyonight]])
-- vim.cmd([[colorscheme tokyonight-storm]])


-- Colors customize
-- Errors, warning, notice, column colors
vim.api.nvim_set_hl(0, "SignColumn", {
    bg = "none"
})

-- Limit line colors
vim.api.nvim_set_hl(0, "ColorColumn", {
    ctermbg = 0,
    bg = "#555555"
})

vim.api.nvim_set_hl(0, "CursorLineNR", {
    bg = "none"
})

-- All terminal colors
vim.api.nvim_set_hl(0, "Normal", {
    bg = "none"
})

-- Numbers color
vim.api.nvim_set_hl(0, "LineNr", {
    fg = "#68E9B0",
})

vim.api.nvim_set_hl(0, "LineNrAbove", {
    fg = "#5eacd3",
})

vim.api.nvim_set_hl(0, "LineNrBelow", {
    fg = "#5eacd3",
})

vim.api.nvim_set_hl(0, "netrwDir", {
    fg = "#5eacd3"
})

-- #######################
-- Bufferline setp
-- #######################
-- require("bufferline").setup{}
require('bufferline').setup {
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        numbers = "none", -- "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string
        close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
        indicator = {
            -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'underline' -- 'icon' | 'underline' | 'none',
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 18,
        diagnostics = false, -- | "nvim_lsp" | "coc"
        diagnostics_update_in_insert = false,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer", -- | function
                text_align = "left", -- | "center" | "right"
                separator = true
            }
        },
        color_icons = true, -- true | false, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true, -- true | false, -- disable filetype icons for buffers
        show_buffer_close_icons = false, -- true | false,
        show_buffer_default_icon = true, -- true | false, -- whether or not an unrecognised filetype should show a default icon
        show_close_icon = false, -- true | false,
        show_tab_indicators = true, -- true | false,
        show_duplicate_prefix =  true, -- true | false, -- whether to show duplicate buffer prefix
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = false, -- false | true,
        always_show_bufferline = true, -- true | false,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
        sort_by = 'insert_at_end'
    }
}


-- #######################
-- Status bar setup
-- #######################

-- Lualine
-- local custom_gruvbox = require'lualine.themes.gruvbox'

require('lualine').setup {
  options = {
    theme = "tokyonight"
    -- theme = "nightfox"
  },
}

-- #######################
-- NvimTree - setup
-- #######################
require('nvim-tree').setup({
    view = {
        width = 35,
    },
    renderer = {
        icons = {
            show = {
                git = false
            },
        },
        highlight_opened_files = 'name'
    },
})

-- #######################
-- Indent blankline
-- #######################
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

-- #######################
-- Git signs setup
-- #######################
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  numhl = false,
  linehl = false,
  keymaps = {},
  watch_gitdir = {
    interval = 1000
  },
  signcolumn = false,
  current_line_blame = false,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  diff_opts={
    internal = true,  -- If luajit is present
  }
}


-- #######################
-- Telescope setup
-- #######################

require('telescope').setup{
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,

		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            n = {
    	        ['<C-d>'] = require('telescope.actions').delete_buffer
            },
            i = {
                ['<C-d>'] = require('telescope.actions').delete_buffer
            }
        }
    },
}
require('telescope').load_extension 'fzf'
require("telescope").load_extension "file_browser"


-- #######################
-- TreeSitter setup
-- #######################

require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  ignore_install = { "phpdoc" },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  } ,
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = { "php" },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
  },
}

-- #######################
-- Prettier
-- #######################

-- #######################
-- Extra
-- #######################

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- #######################
-- Mappings
-- #######################

-- Variables
local opts = { noremap=true, silent=true }
-- local themes = require "telescope.themes"

-- Ex mode
-- vim.api.nvim_set_keymap('n', '<leader>pv', '<cmd>Ex<CR>', opts)

-- Extra
vim.api.nvim_set_keymap('n', 'Y', 'yg$', opts)
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', opts)
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', opts)
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', opts)
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', opts)
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', opts)
vim.api.nvim_set_keymap('n', 'q', '<Nop>', opts) -- Disabled recording macro key

-- Close current buffer
vim.api.nvim_set_keymap('n', '<leader>jk', '<cmd>:bw<CR>', opts)

-- Gitsigns
vim.api.nvim_set_keymap('', '<leader>bl', ':Gitsigns blame_line<CR>', opts)

-- Keeps current visual block selection after indent with '<' or '>'
vim.api.nvim_set_keymap('v', '>', '>gv', opts)
vim.api.nvim_set_keymap('v', '<', '<gv', opts)

-- Use 'asd' on insert mode to enter on Normal Mode
vim.api.nvim_set_keymap('i', 'asd', '<Esc>', opts)

-- Move line up
vim.api.nvim_set_keymap('n', '<C-k>', 'ddkP', opts)

-- Move line down
vim.api.nvim_set_keymap('n', '<C-j>', 'ddp', opts)

-- #######################
-- Telescope Mappings
-- #######################

-- Git Files
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require"mappings".git_files()<cr>', opts)

-- Project search
vim.api.nvim_set_keymap('n', '<leader>fp', '<cmd>lua require"mappings".project_search()<cr>', opts)

-- Find Files
vim.api.nvim_set_keymap('n', '<leader>fd', '<cmd>lua require"mappings".find_files()<cr>', opts)

-- Find All Files
vim.api.nvim_set_keymap('n', '<leader>fs', '<cmd>lua require"mappings".live_grep()<cr>', opts)

-- File Browser
vim.api.nvim_set_keymap('n', '<leader>fe', '<cmd>lua require"mappings".file_browser()<cr>', opts)

-- Current buffer fuzzy find
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require"mappings".curbuf()<cr>', opts)

-- Buffers
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require"mappings".buffers()<cr>', opts)

-- Help tags
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require"mappings".help_tags()<cr>', opts)

-- LSP - Code implementations
vim.api.nvim_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)

-- LSP - references
vim.api.nvim_set_keymap('n', "gr", '<cmd>lua require"mappings".lsp_references()<CR>', opts)

-- Git commits
vim.api.nvim_set_keymap('n', '<leader>gc', '<cmd>lua require"mappings".git_commits()<cr>', opts)

-- Git WorkTree
vim.api.nvim_set_keymap('n', '<leader>gw', '<cmd>lua require"mappings".git_worktree()<cr>', opts)

-- Git branches
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>lua require"mappings".git_branches()<cr>', opts)

-- Git status
vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>lua require"mappings".git_status()<cr>', opts)

-- Exit
vim.api.nvim_set_keymap('i', '<C-c>', '<esc>', opts)

-- Vim commentary
vim.api.nvim_set_keymap('n', 'gc', [[v:lua.context_commentstring.update_commentstring_and_run('Commentary')]], opts)
vim.api.nvim_set_keymap('x', 'gc', [[v:lua.context_commentstring.update_commentstring_and_run('Commentary')]], opts)
vim.api.nvim_set_keymap('o', 'gc', [[v:lua.context_commentstring.update_commentstring_and_run('Commentary')]], opts)
vim.api.nvim_set_keymap('n', 'gcc', [[v:lua.context_commentstring.update_commentstring_and_run('CommentaryLine')]], opts)
vim.api.nvim_set_keymap('n', 'cgc', [[v:lua.context_commentstring.update_commentstring_and_run('ChangeCommentary')]], opts)


-- #######################
-- LSP - Mappings
-- #######################

-- Lsp finder find the symbol definition implement reference
-- when you use action in finder like open vsplit then you can
-- LSP Saga help
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

-- Code action
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
vim.api.nvim_set_keymap("v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

-- Rename
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)

-- Peek Definition
vim.api.nvim_set_keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)

-- Show line diagnostics
vim.api.nvim_set_keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

-- Show cursor diagnostic
vim.api.nvim_set_keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

-- Diagnsotic jump can use `<c-o>` to jump back
vim.api.nvim_set_keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.api.nvim_set_keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

-- Outline
vim.api.nvim_set_keymap("n","<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

-- Hover Doc
vim.api.nvim_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)


local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		-- on_attach = function()
			-- vim.api.nvim_set_keymap('n', "gD", '<cmd> lua vim.lsp.buf.definition()<CR>', opts)
            -- vim.api.nvim_set_keymap('n', "K", '<cmd> lua vim.lsp.buf.hover()<CR>', opts)
            -- vim.api.nvim_set_keymap('n', "<leader>rn", '<cmd> lua vim.lsp.buf.rename()<CR>', opts)
		-- end,
	}, _config or {})
end

-- #######################
-- NvimTree - Key mappings
-- #######################
vim.api.nvim_set_keymap('', '<leader>e', ':NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>o', ':NvimTreeFocus<CR>', opts)

-- #######################
-- Harpoon - Key mappings
-- #######################
-- vim.api.nvim_set_keymap('', '<leader>e', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
-- vim.api.nvim_set_keymap('', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>', opts)
-- vim.api.nvim_set_keymap('', '<leader>tc', ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', opts)

-- vim.api.nvim_set_keymap('', '<leader>n', ':lua require("harpoon.ui").nav_next()<CR>', opts)
-- vim.api.nvim_set_keymap('', '<leader>p', ':lua require("harpoon.ui").nav_prev()<CR>', opts)

-- vim.api.nvim_set_keymap('', '<leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
-- vim.api.nvim_set_keymap('', '<leader>2',  ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
-- vim.api.nvim_set_keymap('', '<leader>3',  ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
-- vim.api.nvim_set_keymap('', '<leader>4',  ':lua require("harpoon.ui").nav_file(4)<CR>', opts)


-- #######################
-- Bufferline - Key mappings
-- #######################
-- TODO: use a function to map
vim.api.nvim_set_keymap('', '<leader>1', ':lua require("bufferline").go_to_buffer(1, true)<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>2', ':lua require("bufferline").go_to_buffer(2, true)<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>3', ':lua require("bufferline").go_to_buffer(3, true)<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>4', ':lua require("bufferline").go_to_buffer(4, true)<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>5', ':lua require("bufferline").go_to_buffer(5, true)<CR>', opts)


-- #######################
-- Windows manager - Key mappings
-- #######################
vim.api.nvim_set_keymap('', '<up>', '<nop>', opts)
vim.api.nvim_set_keymap('', '<down>', '<nop>', opts)
vim.api.nvim_set_keymap('', '<left>', '<nop>', opts)
vim.api.nvim_set_keymap('', '<right>', '<nop>', opts)

-- Manage your windows like a boss
vim.api.nvim_set_keymap('n', '<leader>wn', ':vsplit<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>sh', ':split<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<up>',    ':resize +2<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<down>',  ':resize -2<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<left>',  ':vertical resize -2<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<right>', ':vertical resize +2<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>rr', '<C-w>r', opts)
-- vim.api.nvim_set_keymap('n', '<leader>=', '<C-w>=', opts)
vim.api.nvim_set_keymap('n', '<leader>wl', ':wincmd l<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wk', ':wincmd k<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wj', ':wincmd j<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wh', ':wincmd h<CR>', opts)


-- #######################
-- LSP - Servers setup
-- #######################

require("nvim-lsp-installer").setup {}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = true,
    signs = true,
    virtual_text = true,
  }
)

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

-- LSP -Typescript server
require("lspconfig").tsserver.setup(config({
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx"
    },
    cmd = { "typescript-language-server", "--stdio" }
}))

-- LSP - Tailwindcss server
require("lspconfig").tailwindcss.setup(config({
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx"
    },
}))

-- LSP - CSS server
require("lspconfig").cssls.setup(config())

-- LSP - Rust server
require("lspconfig").rust_analyzer.setup(config({
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
}))

-- LSp - GO Server
require("lspconfig").gopls.setup(config({
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}))

-- LSP - Intelephense PHP server
require("lspconfig").intelephense.setup(config({
  settings = {
      intelephense = {
          stubs = {
            "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date",
            "dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm", "ftp", "gd", "gettext",
            "gmp", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring", "meta", "mysqli",
            "oci8", "odbc", "openssl", "pcntl", "pcre", "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql",
            "Phar", "posix", "pspell", "readline", "Reflection", "session", "shmop", "SimpleXML", "snmp", "soap",
            "sockets", "sodium", "SPL", "sqlite3", "standard", "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy",
            "tokenizer", "xml", "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib",
            "wordpress", "woocommerce","acf-pro", "wordpress-globals", "wp-cli", "genesis", "polylang", "phpunit"
          },
          diagnostics = {
            enable = true,
        },  
          files = {
              maxSize = 5000000,
          }
      },
      json = {
        schemas = {
         {
          description = "NPM configuration file",
          fileMatch = {
           "package.json",
          },
          url = "https://json.schemastore.org/package.json",
         },
        },
      },
  }
}));


require("lspconfig").lua_ls.setup(config({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
}))

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
