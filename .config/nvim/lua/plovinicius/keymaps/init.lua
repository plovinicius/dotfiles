local nnoremap = require("plovinicius.keymaps.utils").nnoremap
local vnoremap = require("plovinicius.keymaps.utils").vnoremap
local inoremap = require("plovinicius.keymaps.utils").inoremap
local tnoremap = require("plovinicius.keymaps.utils").tnoremap
local xnoremap = require("plovinicius.keymaps.utils").xnoremap
local conform = require("conform")
local utils = require("plovinicius.utils")

local M = {}

local TERM = os.getenv("TERM")

-- Normal --
-- Disable Space bar since it'll be used as the leader key
nnoremap("<space>", "<nop>")

-- Window +  better kitty navigation
nnoremap("<C-j>", function()
	if vim.fn.exists(":KittyNavigateDown") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateDown()
	elseif vim.fn.exists(":NvimTmuxNavigateDown") ~= 0 then
		vim.cmd.NvimTmuxNavigateDown()
	else
		vim.cmd.wincmd("j")
	end
end)

nnoremap("<C-k>", function()
	if vim.fn.exists(":KittyNavigateUp") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateUp()
	elseif vim.fn.exists(":NvimTmuxNavigateUp") ~= 0 then
		vim.cmd.NvimTmuxNavigateUp()
	else
		vim.cmd.wincmd("k")
	end
end)

nnoremap("<C-l>", function()
	if vim.fn.exists(":KittyNavigateRight") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateRight()
	elseif vim.fn.exists(":NvimTmuxNavigateRight") ~= 0 then
		vim.cmd.NvimTmuxNavigateRight()
	else
		vim.cmd.wincmd("l")
	end
end)

nnoremap("<C-h>", function()
	if vim.fn.exists(":KittyNavigateLeft") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateLeft()
	elseif vim.fn.exists(":NvimTmuxNavigateLeft") ~= 0 then
		vim.cmd.NvimTmuxNavigateLeft()
	else
		vim.cmd.wincmd("h")
	end
end)

-- Swap between last two buffers
-- nnoremap("<leader>'", "<C-^>", { desc = "Switch to last buffer" })

-- Map Oil to <leader>e
nnoremap("<leader>fe", function()
	require("oil").toggle_float()
end)

-- Center buffer while navigating
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("{", "{zz")
nnoremap("}", "}zz")
nnoremap("N", "Nzz")
nnoremap("n", "nzz")
nnoremap("G", "Gzz")
nnoremap("gg", "ggzz")
nnoremap("<C-i>", "<C-i>zz")
nnoremap("<C-o>", "<C-o>zz")
nnoremap("%", "%zz")
nnoremap("*", "*zz")
nnoremap("#", "#zz")

-- Reselect visual block after indent/outdent
nnoremap(">", ">gv")
nnoremap("<", "<gv")
vnoremap(">", ">gv")
vnoremap("<", "<gv")

-- Tabs in visual mode
vnoremap("<S-Tab>", "<gv")
vnoremap("<Tab>", ">gv")

-- Cut in visual mode, which means yank and delete
vnoremap("x", "ygvd")

-- Window/screen navigation
-- nnoremap("<S-Up>", "<cmd>resize +2<CR>")
-- nnoremap("<S-Down>", "<cmd>resize -2<CR>")
-- nnoremap("<S-Rigth>", "<cmd>vertical +2<CR>")
-- nnoremap("<S-Left>", "<cmd>vertical -2<CR>")

-- Window/screen split
nnoremap("<C-w>j", "<cmd>split<Return><C-w>w<CR>")
nnoremap("<C-w>l", "<cmd>vsplit<Return><C-w>w<CR>")
nnoremap("<C-w>q", "<cmd>close<CR>")

-- Resize split windows to be equal size
-- nnoremap("<leader>=", "<C-w>=")

-- Press 'S' for quick find/replace for the word under the cursor
nnoremap("S", function()
	local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
	local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end)

vnoremap("S", function()
	local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
	local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end)

-- Open Spectre for global find/replace
nnoremap("<leader>S", function()
	require("spectre").toggle()
end)

-- Open Spectre for global find/replace for the word under the cursor in normal mode
-- TODO Fix, currently being overriden by Telescope
nnoremap("<leader>sw", function()
	require("spectre").open_visual({ select_word = true })
end, { desc = "Search current word" })

vnoremap("<leader>sw", function()
	require("spectre").open_visual({ select_word = true })
end, { desc = "Search current word" })

-- Diagnostics

-- Goto next diagnostic of any severity
nnoremap("]d", function()
	vim.diagnostic.goto_next({})
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous diagnostic of any severity
nnoremap("[d", function()
	vim.diagnostic.goto_prev({})
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto next error diagnostic
nnoremap("]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous error diagnostic
nnoremap("[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto next warning diagnostic
nnoremap("]w", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous warning diagnostic
nnoremap("[w", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Open the diagnostic under the cursor in a float window
nnoremap("<C-.>", function()
	vim.diagnostic.open_float({
		border = "rounded",
	})
end)

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
nnoremap("k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
nnoremap("j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- move lines
vnoremap("K", ":m '<-2<CR>gv=gv")
vnoremap("J", ":m '>+1<CR>gv=gv")

-- Inverse tab in insert mode
inoremap("<S-Tab>", "<C-d>")

-- Place all dignostics into a qflist
nnoremap("<leader>ld", vim.diagnostic.setqflist, { desc = "Quickfix [L]ist [D]iagnostics" })

-- Navigate to next qflist item
nnoremap("<leader>cj", ":cnext<cr>zz")

-- Navigate to previos qflist item
nnoremap("<leader>ck", ":cprevious<cr>zz")

-- Open the qflist
nnoremap("<leader>co", ":copen<cr>zz")

-- Close the qflist
nnoremap("<leader>cw", ":cclose<cr>zz")

-- Map MaximizerToggle (szw/vim-maximizer) to leader-m
nnoremap("<leader>m", ":MaximizerToggle<cr>")

-- Paste replace visual selection without copying it.
vnoremap("p", '"_dP')

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap("y", "myy`y")
vnoremap("Y", "myY`y")

-- Press leader fl to format
nnoremap("<leader>fl", function()
	conform.format({ async = true, lsp_fallback = true })
end, { desc = "Format the current buffer" })

-- Press leader rw to rotate open windows
nnoremap("<leader>rw", ":RotateWindows<cr>", { desc = "[R]otate [W]indows" })

-- Press gx to open the link under the cursor
nnoremap("<leader>gl", ":sil !open <cWORD><cr>", { silent = true })

-- Git keymaps --
nnoremap("<leader>gg", ":Gitsigns toggle_current_line_blame<cr>")
nnoremap("<leader>gf", function()
	local cmd = {
		"sort",
		"-u",
		"<(git diff --name-only --cached)",
		"<(git diff --name-only)",
		"<(git diff --name-only --diff-filter=U)",
	}

	if not utils.is_git_directory() then
		vim.notify(
			"Current project is not a git directory",
			vim.log.levels.WARN,
			{ title = "Telescope Git Files", git_command = cmd }
		)
	else
		require("telescope.builtin").git_files()
	end
end, { desc = "Search [G]it [F]iles" })

-- Telescope keybinds --
nnoremap("<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
nnoremap("<C-b>", require("telescope.builtin").buffers, { desc = "[S]earch Open [B]uffers" })
nnoremap("<C-p>", function()
	require("telescope.builtin").find_files({ hidden = true })
end, { desc = "[S]earch [F]iles" })
nnoremap("<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
nnoremap("<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })

nnoremap("<leader>sc", function()
	require("telescope.builtin").commands(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "[S]earch [C]ommands" })

nnoremap("<leader>ff", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

nnoremap("<leader>ss", function()
	require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "[S]earch [S]pelling suggestions" })

-- LSP Keybinds (exports a function to be used in ../../after/plugin/lsp.lua b/c we need a reference to the current buffer) --
M.map_lsp_keybinds = function(buffer_number)
	nnoremap("<leader>re", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame", buffer = buffer_number })
	nnoremap("<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction", buffer = buffer_number })

	nnoremap("gd", vim.lsp.buf.definition, { desc = "LSP: [G]oto [D]efinition", buffer = buffer_number })

	-- Telescope LSP keybinds --
	nnoremap(
		"gr",
		require("telescope.builtin").lsp_references,
		{ desc = "LSP: [G]oto [R]eferences", buffer = buffer_number }
	)

	nnoremap(
		"<leader>gi",
		require("telescope.builtin").lsp_implementations,
		{ desc = "LSP: [G]oto [I]mplementation", buffer = buffer_number }
	)

	nnoremap(
		"<leader>ds",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "LSP: [B]uffer [S]ymbols", buffer = buffer_number }
	)

	nnoremap(
		"<leader>ps",
		require("telescope.builtin").lsp_workspace_symbols,
		{ desc = "LSP: [P]roject [S]ymbols", buffer = buffer_number }
	)

	-- See `:help K` for why this keymap
	nnoremap("K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation", buffer = buffer_number })
	nnoremap("<C-k>", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })

	-- Lesser used LSP functionality
	nnoremap("td", vim.lsp.buf.type_definition, { desc = "LSP: [T]ype [D]efinition", buffer = buffer_number })
end

-- Symbol Outline keybind
nnoremap("<leader>so", ":SymbolsOutline<cr>")

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
nnoremap("L", "$")
nnoremap("H", "^")
vnoremap("L", "$")
vnoremap("H", "^")

-- Press 'U' for redo
nnoremap("U", "<C-r>")

-- Turn off highlighted results
nnoremap("<C-c>", "<cmd>noh<cr>")
inoremap("<C-c>", "<cmd>noh<cr>")

-- Increment/decrement
nnoremap("+", "<C-a>")
nnoremap("-", "<C-x>")

-- Disabled recording macro key
-- Change macro key
nnoremap("q", "<Nop>")
nnoremap("Q", "q")

-- Save file
nnoremap("<C-s>", "<cmd>w<cr><esc>")

-- Map jj to <esc>
inoremap("jk", "<esc>")

-- Create empty line up/down
nnoremap("<Enter>", "o<Esc>")
nnoremap("<S-Enter>", "O<Esc>")

-- Map C-c to <esc> in insert mode
inoremap("<C-c>", "<esc><esc>")

-- Rename highlighted text
vnoremap("<C-r>", '"hy:%s/<C-r>h//g<left><left>')

--
-- Delete but not put in the undo buffer
nnoremap("x", '"_x')

nnoremap("d", '"_d')
vnoremap("d", '"_d')
xnoremap("d", '"_d')

nnoremap("D", '"_D')
vnoremap("D", '"_D')
xnoremap("D", '"_D')

nnoremap("c", '"_c')
vnoremap("c", '"_c')
xnoremap("c", '"_c')

nnoremap("C", '"_C')
vnoremap("C", '"_C')
xnoremap("C", '"_C')

-- Copy current file path to clipboard
nnoremap("<leader>%", "<cmd>let @+=expand('%')<cr>", { silent = true })

-- Close current buffer
nnoremap("<leader>w", "<cmd>bd<cr>")
nnoremap("<A-w>", "<cmd>bd<cr>")

-- switch between buffers
nnoremap("<A-k>", "<cmd>bprevious<cr>")
nnoremap("<A-j>", "<cmd>bnext<cr>")

-- Terminal --
-- Enter normal mode while in a terminal
tnoremap("<esc>", [[<C-\><C-n>]])
tnoremap("jj", [[<C-\><C-n>]])

-- Window navigation from terminal
tnoremap("<C-h>", [[<Cmd>wincmd h<CR>]])
tnoremap("<C-j>", [[<Cmd>wincmd j<CR>]])
tnoremap("<C-k>", [[<Cmd>wincmd k<CR>]])
tnoremap("<C-l>", [[<Cmd>wincmd l<CR>]])

-- Reenable default <space> functionality to prevent input delay
tnoremap("<space>", "<space>")

return M
