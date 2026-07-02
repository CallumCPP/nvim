return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = { "rafamadriz/friendly-snippets" },
	---@module "blink.cmp"
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "enter" },
		completion = {
			-- avoid accepting a preselected item when pressing <CR> just to
			-- make a newline; require an explicit selection first
			list = { selection = { preselect = false } },
			documentation = { auto_show = true },
		},
		-- sources.default = { "lsp", "path", "snippets", "buffer" } and buffer
		-- only fires as a fallback when lsp/path return nothing, so LSP and
		-- buffer suggestions no longer duplicate each other (unlike nvim-cmp,
		-- where both sources queried concurrently and merged results).
	},
}
