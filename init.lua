-- Load options
require("options")

-- Initialise Lazy
require("config.lazy")

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
