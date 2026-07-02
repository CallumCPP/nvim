return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
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
			"ts_ls",
			"cmake",
			"tinymist",
		}

		require("mason").setup({})

		require("mason-lspconfig").setup({
			ensure_installed = lsp_servers,
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local custom_opts = {
			html = {
				filetypes = { "html", "jinja", "jinja2", "htmldjango" },
			},
			jinja_lsp = {
				filetypes = { "html", "jinja", "jinja2", "htmldjango" },
			},
			cmake = {
				filetypes = { "cmake" },
			},
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			},
			tinymist = {
				settings = {
					formatterMode = "typstyle",
					exportPdf = "onSave",
					semanticTokens = "disable",
					projectResolution = "lockDatabase",
				},
				on_attach = function(client, bufnr)
					local root_dir = client.config.root_dir or vim.fn.getcwd()
					local main_file = root_dir .. "/index.typ"

					local function pin_main()
						if vim.fn.filereadable(main_file) == 1 then
							client.request("workspace/executeCommand", {
								command = "tinymist.pinMain",
								arguments = { main_file },
							})
						end
					end

					pin_main()

					vim.api.nvim_create_autocmd("BufEnter", {
						buffer = bufnr,
						callback = pin_main,
					})
				end,
			},
			clangd = {
				cmd = {
					"clangd",
					"--compile-commands-dir=build",
					"--background-index",
					"--clang-tidy",
				},
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
			},
		}

		for _, server in ipairs(lsp_servers) do
			local opts = vim.tbl_deep_extend("force", {
				capabilities = capabilities,
			}, custom_opts[server] or {})

			vim.lsp.config(server, opts)
		end

		-- oxlint LSP (npm-installed, not mason-managed). Lazily attaches on JS/TS
		-- buffers in any project; root falls back to the file's own dir so no
		-- marker file is needed.
		vim.lsp.config("oxlint", {
			capabilities = capabilities,
			workspace_required = false,
			root_dir = function(bufnr, on_dir)
				local fname = vim.api.nvim_buf_get_name(bufnr)
				local found = vim.fs.find(
					{ ".oxlintrc.json", ".oxlintrc.jsonc", "oxlint.config.ts", "package.json", ".git" },
					{ path = fname, upward = true }
				)
				on_dir(found[1] and vim.fs.dirname(found[1]) or vim.fs.dirname(fname))
			end,
		})
		vim.lsp.enable("oxlint")
	end,
}
