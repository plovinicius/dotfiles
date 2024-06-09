return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      local harpoon = require("harpoon.mark")

      vim.cmd [[
        set guioptions-=e " Use showtabline in gui vim
        set sessionoptions+=tabpages,globals " store tabpages and globals in session
      ]]

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
            removed = gitsigns.removed
          }
        end
      end

      require("lualine").setup({
        options = {
          theme = "catppuccin",
          globalstatus = true,
          -- component_separators = { left = "", right = "" },
          section_separators = { left = "█", right = "█" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {},
          lualine_c = {
            {
              'b:gitsigns_head',
              icon = ''
            },
            {
              'diff',
              icon = '',
              source = diff_source
            },
            { 'filename', path = 1 },
            {
              harpoon_component()
            },
            {
              'lsp_progress',
              display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
              spinner_symbols = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
            }
          },
          lualine_x = { 'filetype' },
          lualine_y = {
            {
              'diagnostics',
              symbols = {
                error = '󰅙 ',
                warn = ' ',
                info = ' ',
                hint = ' '
              },
              colored = true,
            }
          },
          lualine_z = {},
        },
      })
    end,
  },
}
