require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_format" },
	},
	lsp_fallback = true,
})

vim.keymap.set("n", "<leader>L", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })
