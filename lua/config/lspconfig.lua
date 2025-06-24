require("mason").setup()

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

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
	},
	handlers = {
		function(server_name)
			lspconfig[server_name].setup({})
		end,

		-- example of a per-server override:
		-- ["lua_ls"] = function()
		--   lspconfig.lua_ls.setup({
		--     settings = { Lua = { diagnostics = { globals = { "vim" } } } }
		--   })
		-- end,
	},
})
