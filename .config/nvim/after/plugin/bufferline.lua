local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup {
  options = {
    numbers = "none",
    indicator = {
      style = 'none',
    },
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    -- separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
    separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
  }
}
