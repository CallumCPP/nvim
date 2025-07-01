return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local servers_and_tools = {
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
      "djlint",
      "stylua",
      "ruff_format",
      "flake8",
      "eslint_d",
      "htmlhint",
      "stylelint",
      "luacheck",
      "clangtidy",
      "clippy",
    }

    require("mason").setup({
      ensure_installed = servers_and_tools,
    })

    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    mason_lspconfig.setup({
      ensure_installed = servers_and_tools,
      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,

        -- Custom setup for clangd to enable clang-tidy
        ["clangd"] = function()
          lspconfig.clangd.setup({
            capabilities = capabilities,
            cmd = { "clangd", "--clang-tidy" },
          })
        end,

        -- Custom setup for rust_analyzer to enable clippy
        ["rust_analyzer"] = function()
          lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
            settings = {
              ["rust-analyzer"] = {
                check = { command = "clippy" },
              },
            },
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
  end,
}
