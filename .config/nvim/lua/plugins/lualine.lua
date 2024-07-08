return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			local harpoon = require("harpoon.mark")

			vim.cmd([[
        set guioptions-=e " Use showtabline in gui vim
        set sessionoptions+=tabpages,globals " store tabpages and globals in session
      ]])

			local function truncate_branch_name(branch)
				if not branch or branch == "" then
					return ""
				end

				-- Match the branch name to the specified format
				local user, team, ticket_number = string.match(branch, "^(%w+)/(%w+)%-(%d+)")

				-- If the branch name matches the format, display {user}/{team}-{ticket_number}, otherwise display the full branch name
				if ticket_number then
					return user .. "/" .. team .. "-" .. ticket_number
				else
					return branch
				end
			end

			local function harpoon_component()
				local total_marks = harpoon.get_length()

				if total_marks == 0 then
					return ""
				end

				local current_mark = "—"

				local mark_idx = harpoon.get_current_index()
				if mark_idx ~= nil then
					current_mark = tostring(mark_idx)
				end

				return string.format("󱡅 %s/%d", current_mark, total_marks)
			end

			local function diff_source()
				local gitsigns = vim.b.gitsigns_status_dict
				if gitsigns then
					return {
						added = gitsigns.added,
						modified = gitsigns.changed,
						removed = gitsigns.removed,
					}
				end
			end

			local get_color = require("lualine.utils.utils").extract_highlight_colors
			require("lualine").setup({
				options = {
					theme = "catppuccin",
					globalstatus = true,
					icons_enabled = true,
					section_separators = { left = "█", right = "█" },
				},
				sections = {
					lualine_a = {
						{
							"mode",
							fmt = string.upper,
						},
					},
					lualine_b = {},
					lualine_c = {
						{
							"b:gitsigns_head",
							icon = "",
						},
						{
							"diff",
							icon = "",
							source = diff_source,
						},
						{ "filename", path = 1 },
						{
							harpoon_component(),
						},
						{
							"lsp_progress",
							display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
							spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
						},
					},
					lualine_x = {
						{
							"diagnostics",
							symbols = {
								error = " ",
								warn = " ",
								info = " ",
								hint = " ",
							},
							colored = true,
							diagnostics_color = {
								error = {
									fg = get_color("DiagnosticSignError", "fg"),
								},
								warn = {
									fg = get_color("DiagnosticSignWarn", "fg"),
								},
								info = {
									fg = get_color("DiagnosticSignInfo", "fg"),
								},
								hint = {
									fg = get_color("DiagnosticSignHint", "fg"),
								},
							},
						},
					},
					lualine_y = {
						{
							"aerial",
							sep = " | ",
						},
						"filetype",
					},
					lualine_z = { "%l:%c", "%p%%/%L" },
				},
				-- tabline = {
				-- 	lualine_a = { "buffers" },
				-- 	lualine_b = {},
				-- 	lualine_c = {},
				-- 	lualine_x = {},
				-- },
			})
		end,
	},
}
