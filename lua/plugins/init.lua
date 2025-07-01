return {
	-- Essentials
	"nvim-treesitter/nvim-treesitter",
	"nvim-tree/nvim-web-devicons",
	{ "nvim-tree/nvim-tree.lua", opts = {} },

	-- Mason and LSP
	"williamboman/mason.nvim",
	{ "williamboman/mason-lspconfig.nvim", dependencies = { "williamboman/mason.nvim" } },
	"neovim/nvim-lspconfig",

	-- Color Schemes
	"rebelot/kanagawa.nvim",
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
