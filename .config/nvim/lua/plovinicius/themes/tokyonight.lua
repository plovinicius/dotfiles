local status, tokyonight = pcall(require, "tokyonight")
if (not status) then return end

tokyonight.setup({
    style = "night",
    transparent = "true",
    on_colors = function(colors)
        colors.errors = "#ff0000"
    end
})