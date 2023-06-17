local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

treesitter.setup {
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    } ,
    highlight = {
            enable = true,
            disable = {},
    },
    indent = {
            enable = true,
            disable = {},
    },
    ensure_installed = {
            "markdown",
            "markdown_inline",
            "tsx",
            "toml",
            "php",
            "json",
            "yaml",
            "css",
            "html",
            "lua",
            "rust",
            "scss",
            "sql",
    },
    autotag = {
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

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }