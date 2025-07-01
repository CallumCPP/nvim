-- Load options
require("options")

-- Initialise plugins
require("config.lazy")
require("config.lspconfig")

-- Load keymap
require("keymap")

-- Set theme
vim.cmd[[colorscheme tokyonight-night]]

-- Set filetypes
vim.filetype.add({
  extension = {
    j2 = "jinja",
    jinja2 = "jinja",
  },
})
