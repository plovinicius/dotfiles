local mason_status, mason = pcall(require, "mason")
local masonlsp_status, masonlsp = pcall(require, "mason-lspconfig")
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
local cmp_status, cmp = pcall(require, "cmp")
local nvimlsp_status, nvimlsp = pcall(require, "cmp_nvim_lsp")
local luasnip_status, luasnip = pcall(require, "luasnip")

if (not mason_status or not masonlsp_status or not cmp_status or not lspconfig_status or not luasnip_status) then return end

local capabilities = nvimlsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

mason.setup()
masonlsp.setup {
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "tsserver",
    "tailwindcss",
    "phpactor",
    "jsonls",
    "marksman"
  },
}

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
		-- code_action_icon = "💡",
		symbol_in_winbar = {
			in_custom = false,
			enable = true,
			separator = " ",
			show_file = true,
			file_formatter = ""
    },
	})
end
-- END LSP saga

-- Init LSPs
lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

lspconfig.tsserver.setup {
  capabilities = capabilities
}

lspconfig.tailwindcss.setup {
  capabilities = capabilities
}

lspconfig.rust_analyzer.setup {
  capabilities = capabilities
}

lspconfig.lua_ls.setup {
  capabilities = capabilities
}

lspconfig.lua_ls.setup {
  capabilities = capabilities
}

lspconfig.jsonls.setup {
  capabilities = capabilities
}

lspconfig.marksman.setup {
  capabilities = capabilities
}

lspconfig.phpactor.setup {
  capabilities = capabilities
}
-- END Init LSPs