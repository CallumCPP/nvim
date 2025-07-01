require("mason").setup()

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason_lspconfig.setup({
	ensure_installed = {
		"rust_analyzer",
		"clangd",
		"cmake",
		"pyright",
		"html",
		"ts_ls",
		"cssls",
		"lua_ls",
		"docker_compose_language_service",
		"dockerls",
		"jinja_lsp",
	},
	handlers = {
		function(server_name)
			lspconfig[server_name].setup({
				capabilities = capabilities,
			})
		end,

		-- example of a per-server override:
		-- ["lua_ls"] = function()
		--   lspconfig.lua_ls.setup({
		--     settings = { Lua = { diagnostics = { globals = { "vim" } } } }
		--   })
		-- end,
	},
	config = function()
		vim.filetype.add({
			extension = {
				jinja = "jinja",
				jinja2 = "jinja",
				j2 = "jinja",
			},
		})
		local servers = {
			jinja_lsp = {
				filetypes = { "jinja", "rust", "python" },
			},
		}
	end,
})
