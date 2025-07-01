local opts = { noremap = true, silent = true }

-- vim
vim.keymap.set("n", "<ESC>", ":nohlsearch<CR>", opts)

-- nvim-tree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>e", ":NvimTreeOpen<CR>", opts)

-- bufferline
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "<leader>x", ":CloseBufferFocus<CR>", opts)

-- telescope
local telescope_builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, { desc = "Help Tags" })
vim.keymap.set("n", "<leader>fr", ":Telescope resume<CR>", opts)

-- lspconfig
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

-- conform
vim.keymap.set("n", "<leader>L", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })
