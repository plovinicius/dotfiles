local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  },
  "williamboman/mason-lspconfig.nvim",
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/nvim-cmp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "nvim-lua/plenary.nvim",
  "glepnir/lspsaga.nvim",
  "nvim-lualine/lualine.nvim",
  "nvim-tree/nvim-web-devicons",
  {
    "numToStr/Comment.nvim",
    lazy = true
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },
  {
    "folke/todo-comments.nvim",
    lazy = true
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate',
  },
  "nvim-treesitter/nvim-treesitter-textobjects",
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    lazy = true,
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
      },
      "nvim-telescope/telescope-ui-select.nvim"
    }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = true
  },
  "gpanders/editorconfig.nvim",
  "lewis6991/gitsigns.nvim",
  {
    "fatih/vim-go",
    lazy = true,
    build = ":GoUpdateBinaries"
  },
  "simrat39/rust-tools.nvim",
  "knubie/vim-kitty-navigator",
  "mbbill/undotree"
}

local opts = {}

require("lazy").setup(plugins, opts)
