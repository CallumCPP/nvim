return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        on_colors = function(colors)
            colors.fg_gutter = "#868ca2"
        end,
    },
}
