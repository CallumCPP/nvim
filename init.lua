-- Load options
require("options")

-- Set filetypes
vim.filetype.add({
	extension = {
		jinja = "htmldjango",
		j2 = "htmldjango",
		jinja2 = "htmldjango",
		html = "html",
        js = "javascript",
	},
	filename = {
		["cmakelists.txt"] = "cmake",
	},
})

-- Initialise Lazy
require("config.lazy")

-- Load keymap
require("keymap")

-- Set theme
vim.cmd([[colorscheme tokyonight-night]])
