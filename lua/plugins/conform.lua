return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			python = { "ruff_format" },
			htmldjango = { "djlint" },
			javascript = { "oxfmt" },
			typescript = { "oxfmt" },
			javascriptreact = { "oxfmt" },
			typescriptreact = { "oxfmt" },
			json = { "oxfmt" },
			jsonc = { "oxfmt" },
			cpp = { "clang_format" },
			css = { "stylelint" },
			scss = { "stylelint" },
			gdscript = { "gdformat" },
			sh = { "shfmt" },
			bash = { "shfmt" },
		},
		default_format_opts = { lsp_format = "fallback" },
	},
}
