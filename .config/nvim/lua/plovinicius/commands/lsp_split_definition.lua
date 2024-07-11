-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf }

		vim.keymap.set("n", "gD", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", opts)
	end,
})
