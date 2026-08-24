return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup()
		vim.schedule(function()
			require("nvim-treesitter.install").install({
				"c",
				"cpp",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"javascript",
				"typescript",
				"html",
				"css",
				"rust",
				"htmldjango",
				"gdscript",
				"gdshader",
				"godot_resource",
			})
		end)

		-- Neovim's core ftplugins already call vim.treesitter.start() for
		-- lua/help/query/markdown, so only the remaining installed parsers
		-- need it here. Scoping to these filetypes (rather than every
		-- FileType event) avoids firing on parser-less buffers like
		-- lazy/mason/nvim-tree/telescope-prompt, which is what caused the
		-- previous startup error.
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"c",
				"cpp",
				"vim",
				"javascript",
				"typescript",
				"html",
				"css",
				"rust",
				"htmldjango",
				"gdscript",
				"gdshader",
				"godot_resource",
			},
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
