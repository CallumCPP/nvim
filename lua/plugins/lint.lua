return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			python = { "ruff" },
			html = { "htmlhint" },
			css = { "stylelint" },
			lua = { "luacheck" },
			htmldjango = { "djlint" },
			gdscript = { "gdlint" },
		}

		vim.diagnostic.config({
			severity_sort = true,
			virtual_text = true,
		})

		vim.api.nvim_create_autocmd({
			"BufEnter",
			"InsertLeave",
		}, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
