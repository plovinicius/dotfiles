-- local mason_status, mason = pcall(require, "mason")
-- local masonlsp_status, masonlsp = pcall(require, "mason-lspconfig")

-- if (not mason_status or masonlsp_status) then return end

-- mason.setup()
-- masonlsp.setup {
--   ensure_installed = {
--     "lua_ls",
--     "rust_analyzer",
--     "tsserver",
--     "tailwindcss",
--     "phpactor",
--     "jsonls",
--     "marksman"
--   },
-- }