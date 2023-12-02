local status, theme = pcall(require, "tokyonight")
if (not status) then return end
--
theme.setup({
  style = "night",
  transparent = true
})

function ColorMyPencils(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
