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
    "cssls",
    "lua_ls",
    "docker_compose_language_service",
    "dockerls",
    "jinja_lsp",
    "stylua",
    "ruff_format",
    "flake8",
    "eslint_d",
    "htmlhint",
    "stylelint",
    "luacheck",
    "clangtidy",
    "clippy"
  },
  handlers = {
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = capabilities,
      })
    end,

    -- Custom setup for jinja_lsp
    ["jinja_lsp"] = function()
      lspconfig.jinja_lsp.setup({
        capabilities = capabilities,
        filetypes = { "jinja" },
      })
    end,
  },
})
