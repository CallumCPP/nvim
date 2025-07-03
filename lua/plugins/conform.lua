return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format" },
			htmldjango = { "djlint" },
		},
		lsp_fallback = true,
	},
}
