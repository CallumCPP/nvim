return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local lsp_servers = {
			"rust_analyzer",
			"clangd",
			"pyright",
			"html",
			"cssls",
			"lua_ls",
			"dockerls",
			"jinja_lsp",
			"json_ls",
			"biome",
		}

		local linters_formatters = {
			"flake8",
			"eslint_d",
			"htmlhint",
			"luacheck",
			"clippy",
			"clangtidy",
			"djlint",
			"stylua",
			"ruff_format",
			"cmake",
		}

		local ensure_installed = vim.tbl_flatten({ lsp_servers })

		require("mason").setup({
			ensure_installed = linters_formatters,
		})
		require("mason-lspconfig").setup({
			ensure_installed = ensure_installed,
			automatic_installation = true,
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local common_opts = { capabilities = capabilities }

		local custom_opts = {
			html = { filetypes = { "html", "jinja", "jinja2", "htmldjango" } },
			jinja_lsp = { filetypes = { "html", "jinja", "jinja2", "htmldjango" } },
			biome = { workspace_required = false },
		}

		for _, server in ipairs(lsp_servers) do
			local opts = vim.tbl_deep_extend("force", common_opts, custom_opts[server] or {})
			vim.lsp.config(server, opts)
		end
	end,
}
