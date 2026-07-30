return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup({})
		require("mini.pairs").setup({})
		require("mini.comment").setup({})
		require("mini.operators").setup({})

		-- disable auto-closing ' for rust lifetimes
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "rust",
			callback = function(args)
				vim.keymap.set("i", "'", "'", { buffer = args.buf })
			end,
		})
	end,
}
