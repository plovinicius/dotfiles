local mason_status, mason = pcall(require, "mason")
local masonlsp_status, masonlsp = pcall(require, "mason-lspconfig")
local lsp_status, lsp = pcall(require, "lsp-zero")
local cmp_status, cmp = pcall(require, "cmp")
local nvimlsp_status, nvimlsp = pcall(require, "cmp_nvim_lsp")
local luasnip_status, luasnip = pcall(require, "luasnip")

-- if (not mason_status or not masonlsp_status or not cmp_status or not lspconfig_status or not luasnip_status) then return end

local capabilities = nvimlsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
local default_handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

-- Mason
mason.setup()
masonlsp.setup {
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "tsserver",
    "tailwindcss",
    "jsonls",
    "marksman"
  },
  handlers = {
    lsp.default_setup,
  }
}

-- LSP
lsp.preset("recommended")
-- Fix Undefined global 'vim'
vim.g.lsp_zero_extend_lspconfig = 0
lsp.setup()


vim.diagnostic.config({
  virtual_text = true
})

-- CMP
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
    ['<C-e>'] = cmp.mapping.close(),
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
    { name = 'buffer' },
    { name = 'luasnip' },
  },
}
-- END CMP

-- LSP Saga
local lspsaga_status, lspsaga = pcall(require, "lspsaga")
if (lspsaga_status) then
  lspsaga.setup({
    ui = {
      code_action = "󰌶",
      diagnostic = "",
    },
    lightbulb = {
      virtual_text = false,
    },
    finder = {
      quit = { "q", "<ESC>" },
    },
    symbol_in_winbar = {
      enable = false,
      show_file = false,
    },
  })
end
-- END LSP saga

-- Init LSPs
-- lsp.lua_ls.setup {
--   capabilities = capabilities,
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using
--         -- (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {
--           'vim',
--           'require'
--         },
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--     handlers = vim.tbl_deep_extend("force", {}, default_handlers, {})
--   },
-- }

-- lspconfig.tsserver.setup {
--   capabilities = capabilities,
--   handlers = vim.tbl_deep_extend("force", {}, default_handlers, {})
-- }

-- lspconfig.tailwindcss.setup {
--   capabilities = capabilities,
--   handlers = vim.tbl_deep_extend("force", {}, default_handlers, {})
-- }

-- lspconfig.rust_analyzer.setup {
--   capabilities = capabilities,
--   handlers = vim.tbl_deep_extend("force", {}, default_handlers, {})
-- }

-- lspconfig.lua_ls.setup {
--   capabilities = capabilities,
--   handlers = vim.tbl_deep_extend("force", {}, default_handlers, {})
-- }

-- lspconfig.lua_ls.setup {
--   capabilities = capabilities,
--   handlers = vim.tbl_deep_extend("force", {}, default_handlers, {})
-- }

-- lspconfig.jsonls.setup {
--   capabilities = capabilities,
--   handlers = vim.tbl_deep_extend("force", {}, default_handlers, {})
-- }

-- lspconfig.marksman.setup {
--   capabilities = capabilities,
--   handlers = vim.tbl_deep_extend("force", {}, default_handlers, {})
-- }

-- lspconfig.phpactor.setup {
--   capabilities = capabilities,
--   handlers = vim.tbl_deep_extend("force", {}, default_handlers, {})
-- }

-- lspconfig.gopls.setup {
--   capabilities = capabilities,
--   handlers = vim.tbl_deep_extend("force", {}, default_handlers, {})
-- }
-- END Init LSPs
