return {
	{
		"NStefan002/visual-surround.nvim",
		config = function()
			require("visual-surround").setup({
				use_default_keymaps = true,
				-- will be ignored if use_default_keymaps is set to false
				surround_chars = { "{", "}", "[", "]", "(", ")", "'", '"', "`" },
				-- whether to exit visual mode after adding surround
				exit_visual_mode = true,
			})
		end,
	},
}
