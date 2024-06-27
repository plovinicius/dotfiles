return {
	-- PHPCS installation.
	-- https://github.com/WordPress/WordPress-Coding-Standards?tab=readme-ov-file#installation
	-- https://xavortm.com/php_cs-in-neovim/
	{
		"praem90/nvim-phpcsf",
		config = function()
			vim.api.nvim_create_augroup("PHPCSGroup", { clear = true })

			-- require("phpcs").setup({
			-- 	phpcs = "phpcs",
			-- 	phpcbf = "phpcbf",
			-- 	standard = "WordPress",
			-- })

			vim.g.nvim_phpcs_config_phpcs_path = "phpcs"
			vim.g.nvim_phpcs_config_phpcbf_path = "phpcbf"
			vim.g.nvim_phpcs_config_phpcs_standard = "WordPress" -- or path to your ruleset phpcs.xml

			-- Setup auto formatting for php files using phpcs
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				group = "PHPCSGroup",
				pattern = "*.php",
				command = "lua require'phpcs'.cs()",
			})

			vim.api.nvim_create_autocmd("BufWritePost", {
				group = "PHPCSGroup",
				pattern = "*.php",
				command = "lua require'phpcs'.cbf()",
			})
		end,
	},
}
