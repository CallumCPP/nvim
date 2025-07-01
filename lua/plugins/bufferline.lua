return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				offsets = {
					{
						filetype = "NvimTree",
						text = "nvim-tree",
						text_align = "left",
					},
				},
			},
		})

		local function close_buffer()
			local current = vim.api.nvim_get_current_buf()
			vim.cmd("bnext")
			vim.cmd("bd " .. current)
		end
		vim.api.nvim_create_user_command("CloseBufferFocus", close_buffer, {})
	end,
}
