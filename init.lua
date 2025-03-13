-- Load options
require("options")

-- Initialise plugins
require("config.lazy")
require("config.nvim-tree")
require("config.bufferline")
require("config.lspconfig")
require("config.lint")
require("config.autopairs")
require("config.telescope")

-- Load keymap
require("keymap")

-- Set theme
vim.cmd[[colorscheme tokyonight-night]]
