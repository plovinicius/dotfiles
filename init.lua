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

    --File browsing
    use 'nvim-telescope/telescope-file-browser.nvim'

    -- Telescope
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Harpoon
    use 'ThePrimeagen/harpoon'

    -- TODO Comments
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require"todo-comments".setup{}
      end
    }

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

    -- Editing
    use 'tpope/vim-surround'

    -- Comment
    use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines

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
end)


-- #######################
-- Options
-- #######################

-- set map leader
vim.g.mapleader = " "

--Set highlight on search
vim.o.hlsearch = false

--Clipboard
-- vim.api.nvim_set_option('clipboard', 'unnamedplus')

-- Disable swapfile
vim.opt.swapfile = false

-- Disable file backup
vim.opt.backup = false

--Make line numbers default
vim.wo.number = true
vim.opt.nu = true

--Scroll with some lines
vim.opt.scrolloff = 12

--Show relative line number
vim.wo.relativenumber = true

--Show color column
vim.wo.colorcolumn = "120"

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Dont wrap lines
vim.opt.wrap = false

--Decrease update time
vim.o.updatetime = 50
vim.wo.signcolumn = 'yes'

--Set colorscheme
vim.o.termguicolors = true
vim.opt.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
-- vim.cmd [[colorscheme onedark]]

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
-- Status bar setup
-- #######################

-- Lualine
local custom_gruvbox = require'lualine.themes.gruvbox'

require('lualine').setup {
  options = { theme  = custom_gruvbox },
}


-- #######################
-- Comment setup
-- #######################

require('Comment').setup()


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

require("nvim-treesitter.configs").setup({
  -- To install additional languages, do: `:TSInstall <mylang>`. `:TSInstall maintained` to install all maintained
  sync_installed = true,
  highlight = {
   enable = true, -- This is a MUST
   additional_vim_regex_highlighting = { "php" },
  },
  indent = {
   enable = false, -- Really breaks stuff if true
  },
  incremental_selection = {
   enable = true,
   keymaps = {
    init_selection = "gnn",
    node_incremental = "grn",
    scope_incremental = "grc",
    node_decremental = "grm",
   },
  },
})

-- #######################
-- Extra
-- #######################

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
local themes = require "telescope.themes"

-- Close current buffer
vim.api.nvim_set_keymap('n', '<leader>pv', '<cmd>Ex<cr>', opts)

-- Gitsigns
vim.api.nvim_set_keymap('', '<leader>bl', ':Gitsigns blame_line<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>gg', ':Gitsigns toggle_signs<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>gp', ':Gitsigns preview_hunk<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>gi', ':Gitsigns next_hunk<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>go', ':Gitsigns prev_hunk<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>gu', ':Gitsigns reset_hunk<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>ga', ':Gitsigns stage_hunk<CR>', opts)

-- #######################
-- Telescope Mappings
-- #######################

-- Git Files
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua require"mappings".git_files()<cr>', opts)

-- Git Buffer Files
-- vim.api.nvim_set_keymap('n', '<leader>gF', '<cmd>lua require"mappings".buffer_git_files()<cr>', opts)

-- Find Files
vim.api.nvim_set_keymap('n', '<leader>pf', '<cmd>lua require"mappings".search_all_files()<cr>', opts)

-- Grep String
vim.api.nvim_set_keymap('n', '<leader>ps', '<cmd>lua require"mappings".grep_string()<cr>', opts)

-- Grep Word
vim.api.nvim_set_keymap('n', '<leader>pw', '<cmd>lua require"mappings".grep_word()<cr>', opts)

-- Search live grep
-- vim.api.nvim_set_keymap('n', '<leader>fs', '<cmd>lua require"mappings".live_grep()<cr>', opts)

-- File Browser
vim.api.nvim_set_keymap('n', '<leader>pt', '<cmd>lua require"mappings".file_browser()<cr>', opts)

-- Color Scheme
-- vim.api.nvim_set_keymap('n', '<leader>cs', '<cmd>Telescope colorscheme<cr>', opts)

-- Current buffer fuzzy find
vim.api.nvim_set_keymap('n', '<leader>pc', '<cmd>lua require"mappings".curbuf()<cr>', opts)

-- Buffers
vim.api.nvim_set_keymap('n', '<leader>pb', '<cmd>lua require"mappings".buffers()<cr>', opts)

-- Help tags
vim.api.nvim_set_keymap('n', '<leader>vh', '<cmd>lua require"mappings".help_tags()<cr>', opts)

-- LSP - Code diagnostics
-- vim.api.nvim_set_keymap('n', '<leader>cd', '<cmd>Telescope lsp_document_diagnostics<cr>', opts)

-- Git commits
vim.api.nvim_set_keymap('n', '<leader>gc', '<cmd>lua require"mappings".git_commits()<cr>', opts)

-- Git branches
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>lua require"mappings".git_branches()<cr>', opts)

-- Git status
vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>lua require"mappings".git_status()<cr>', opts)


-- #######################
-- LSP - Mappings
-- #######################

-- Note: you must pass the defined on_attach as an argument to every setup {} call and the keybindings 
-- in on_attach only take effect on buffers with an active language server.

local lspconfig = require 'lspconfig'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end


-- #######################
-- Harpoon - Key mappings
-- #######################
vim.api.nvim_set_keymap('', 'mm', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>', opts)

vim.api.nvim_set_keymap('', '<leader>n', ':lua require("harpoon.ui").nav_next()<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>p', ':lua require("harpoon.ui").nav_prev()<CR>', opts)

vim.api.nvim_set_keymap('', '<leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>2',  ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>3',  ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>4',  ':lua require("harpoon.ui").nav_file(4)<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>5',  ':lua require("harpoon.ui").nav_file(5)<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>6',  ':lua require("harpoon.ui").nav_file(6)<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>7',  ':lua require("harpoon.ui").nav_file(7)<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>8',  ':lua require("harpoon.ui").nav_file(8)<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>9',  ':lua require("harpoon.ui").nav_file(9)<CR>', opts)
vim.api.nvim_set_keymap('', '<leader>0',  ':lua require("harpoon.ui").nav_file(0)<CR>', opts)


-- #######################
-- Windows manager - Key mappings
-- #######################
vim.api.nvim_set_keymap('', '<up>', '<nop>', opts)
vim.api.nvim_set_keymap('', '<down>', '<nop>', opts)
vim.api.nvim_set_keymap('', '<left>', '<nop>', opts)
vim.api.nvim_set_keymap('', '<right>', '<nop>', opts)

-- Manage your windows like a boss
vim.api.nvim_set_keymap('n', '<leader>sv', ':vsplit<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>sh', ':split<CR>', opts)
vim.api.nvim_set_keymap('n', '<up>',    ':resize +2<CR>', opts)
vim.api.nvim_set_keymap('n', '<down>',  ':resize -2<CR>', opts)
vim.api.nvim_set_keymap('n', '<left>',  ':vertical resize -2<CR>', opts)
vim.api.nvim_set_keymap('n', '<right>', ':vertical resize +2<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>rr', '<C-w>r', opts)
vim.api.nvim_set_keymap('n', '<leader>=', '<C-w>=', opts)
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<CR>', opts)


-- #######################
-- Treesitter setup
-- #######################

-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
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
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

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
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable the following language servers
local servers = { 'cssls', 'intelephense', 'tsserver' }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Example custom server
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

-- LSP - Intelephense setup
lspconfig.intelephense.setup({
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
});


lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

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
