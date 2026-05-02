return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup()
		vim.schedule(function()
			require("nvim-treesitter.install").install({
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
				"htmldjango",
			})
		end)
	end,
}
