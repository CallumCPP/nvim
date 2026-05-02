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
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
