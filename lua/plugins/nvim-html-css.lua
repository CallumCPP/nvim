return {
	"Jezda1337/nvim-html-css",
	dependencies = { "hrsh7th/nvim-cmp", "nvim-treesitter/nvim-treesitter" },

	config = function()
		require("html-css").setup({
			enable_on = {
				"html",
				"htmldjango",
				"tsx",
				"jsx",
				"erb",
				"svelte",
				"vue",
				"blade",
				"php",
				"templ",
				"astro",
			},
			handlers = {
				definition = {
					bind = "gd",
				},
				hover = {
					bind = "K",
					wrap = true,
					border = "none",
					position = "cursor",
				},
			},
			documentation = {
				auto_show = true,
			},
			style_sheets = {
				"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
				"./*.css",
				"./**/*.css",
			},
		})
	end,
}
