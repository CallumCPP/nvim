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

-- diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set("n", "<leader>D", function()
	local _, winid = vim.diagnostic.open_float(nil, { focus = false })
	if winid then vim.api.nvim_set_current_win(winid) end
end, { desc = "Enter diagnostic float" })
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Prev diagnostic" })

-- lspconfig
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "<leader>fa", function()
	vim.lsp.buf.code_action({
		apply = true,
		context = { only = { "source.fixAll" } },
	})
end, { desc = "Apply safe fixes" })

-- conform
vim.keymap.set("n", "<leader>L", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format file" })

-- molten & quarto
local runner = require("quarto.runner")
vim.keymap.set("n", "<leader>rc", runner.run_cell, { desc = "Run Cell", silent = true })
vim.keymap.set("n", "<leader>ra", runner.run_above, { desc = "Run Cell and Above", silent = true })
vim.keymap.set("n", "<leader>rA", runner.run_all, { desc = "Run All Cells", silent = true })

vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "Molten Init", silent = true })
vim.keymap.set("n", "<leader>og", ":noautocmd MoltenEnterOutput<CR>", { desc = "Open Output Window", silent = true })
vim.keymap.set("n", "<leader>oh", ":MoltenHideOutput<CR>", { desc = "Hide Output", silent = true })
vim.keymap.set("n", "<leader>os", ":MoltenShowOutput<CR>", { desc = "Show Output", silent = true })
vim.keymap.set("n", "<leader>od", ":MoltenDelete<CR>", { desc = "Delete Cell", silent = true })
