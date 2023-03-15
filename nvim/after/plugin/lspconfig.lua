local status, lsp = pcall(require, "lspconfig")
if (not status) then return end

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

local on_attach = function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    -- vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "gr", '<cmd>lua require"mappings".lsp_references()<CR>', opts)
    vim.keymap.set("n", "gi", '<cmd>lua require"mappings".lsp_implementations()<CR>', opts)
    -- vim.kenmap.set("n", "<leader>cr", function() vim.lsp.buf.rename() end, opts)
end

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = on_attach
	}, _config or {})
end

-- LSP -Typescript server
lsp.tsserver.setup(config({
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
lsp.tailwindcss.setup(config({
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
lsp.cssls.setup(config())

-- LSP - Rust server
lsp.rust_analyzer.setup(config({
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    on_attach = on_attach,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}))

-- LSP - Intelephense PHP server
lsp.intelephense.setup(config({
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


lsp.lua_ls.setup(config({
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
