return {
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  "neovim/nvim-lspconfig",
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  -- Color Schemes
  "rebelot/kanagawa.nvim",
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  }
}
