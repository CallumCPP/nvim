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
require("config.conform")

-- Load keymap
require("keymap")

-- Set theme
require("config.theme")
vim.cmd[[colorscheme tokyonight-night]]
