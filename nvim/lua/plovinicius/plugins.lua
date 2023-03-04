local status, packer = pcall(require, "packer")
if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- Package installer
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim' -- Common utilities
    use { "ellisonleao/gruvbox.nvim" } -- Color theme
    use "EdenEast/nightfox.nvim" -- Color theme
    use "folke/tokyonight.nvim" -- Color theme
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- use 'ThePrimeagen/harpoon'
    use {
        "folke/todo-comments.nvim", -- Highlight TODO | FIXME
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require"todo-comments".setup{}
        end
    }
    use 'lukas-reineke/indent-blankline.nvim' -- Add colnm and line extra info eg: context, spacings and eol
    use {
        'lewis6991/gitsigns.nvim', -- Git blame and other things
        requires = 'nvim-lua/plenary.nvim'
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
  
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
  
            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use 'glepnir/lspsaga.nvim' -- LSP UIs
    -- use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
    -- use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    -- use 'hrsh7th/nvim-cmp' -- Completion
    -- use 'hrsh7th/cmp-path'
    -- use 'L3MON4D3/LuaSnip'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    -- use 'nvim-treesitter/nvim-treesitter'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects' -- Syntax aware text-objects, select, move, swap, and peek support.

    -- Seems like I dont need this anymore
    -- use 'sheerun/vim-polyglot' -- Syntax highlighting 
    use 'nvim-lualine/lualine.nvim' -- Statusline
    use 'kyazdani42/nvim-web-devicons' -- File icons
    
    -- use {
    --     'nvim-lualine/lualine.nvim', -- Statusline
    --     requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    -- }

    -- Should I use?
    -- use 'onsails/lspkind-nvim' -- vscode-like pictograms
    -- use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    -- use 'williamboman/mason.nvim'
    -- use 'williamboman/mason-lspconfig.nvim'
    -- use 'windwp/nvim-autopairs'
    -- use 'windwp/nvim-ts-autotag'
    -- use 'norcalli/nvim-colorizer.lua'
    -- use { 
    --     "stephpy/vim-php-cs-fixer",
    --     config = function()
    --         require("after.plugin.php_cs_fixer").config()
    --     end
    -- }
end)