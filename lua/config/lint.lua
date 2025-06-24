require("lint").linters_by_ft = {
	python = { "flake8" },
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	html = { "htmlhint" },
	css = { "stylelint" },
	lua = { "luacheck" },
	c = { "clangtidy" },
	cpp = { "clangtidy" },
	rust = { "clippy" },
}

vim.diagnostic.config({ virtual_text = true })
