require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = require("telescope.actions").close,
            },
        },
        layout_strategy = "horizontal",
--[[         layout_config = {
            preview_width = 0.55,
            prompt_position = "top",
            results_width = 0.8,
         }, ]]
    },
})

require("telescope").load_extension("fzf")
