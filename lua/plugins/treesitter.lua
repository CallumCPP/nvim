return {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"javascript",
				"typescript",
				"html",
				"css",
				"rust",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
			},
		})
	end,
}
