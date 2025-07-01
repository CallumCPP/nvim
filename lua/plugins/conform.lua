return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format" },
			jinja = { "djlint" },
		},
		lsp_fallback = true,
	},
}
