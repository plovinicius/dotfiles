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
    lazy = true
  },
  {
    "folke/todo-comments.nvim",
    lazy = true
  },

  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-tree/nvim-web-devicons"
  --   }
  -- },
  {
    "sainnhe/gruvbox-material",
    enabled = true,
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_transparent_background = 1
      vim.cmd.colorscheme 'gruvbox-material'
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate',
  },
  "nvim-treesitter/nvim-treesitter-textobjects",
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
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
    build = ":GoUpdateBinaries"
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  }
}

local opts = {}

require("lazy").setup(plugins, opts)
