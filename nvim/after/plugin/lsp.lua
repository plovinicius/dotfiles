local status, lsp = pcall(require, "lsp-zero")
if (not status or not installer_status) then return end

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'tailwindcss',
    'cssls',
    'intelephense',
})

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

-- lsp.set_preferences({
--     suggest_lsp_servers = false,
--     sign_icons = {
--         error = 'E',
--         warn = 'W',
--         hint = 'H',
--         info = 'I'
--     }
-- })

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    -- local opts = {
    --     noremap = true,
    --     silent = true,
    -- }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "gr", '<cmd>lua require"mappings".lsp_references()<CR>', opts)
    vim.keymap.set("n", "gi", '<cmd>lua require"mappings".lsp_implementations()<CR>', opts)
    vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})