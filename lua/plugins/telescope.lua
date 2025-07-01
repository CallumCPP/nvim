return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = require("telescope.actions").close,
                        },
                    },
                    layout_strategy = "horizontal",
                },
            })
            telescope.load_extension("fzf")
        end,
    },
}
