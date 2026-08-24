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
		cl = "c",
		tscn = "godot_resource",
		tres = "godot_resource",
		gdshaderinc = "gdshader",
	},
	filename = {
		["cmakelists.txt"] = "cmake",
		["project.godot"] = "godot_resource",
	},
})

-- Initialise Lazy
require("config.lazy")

-- Load keymap
require("keymap")

-- Set theme
vim.cmd([[colorscheme tokyonight-night]])
