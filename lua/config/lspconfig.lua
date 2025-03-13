require("mason").setup()

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
})

local lspconfig = require("lspconfig")

mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({})
    end,
})

