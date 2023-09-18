-- https://github.com/stevearc/aerial.nvim
return {
	"stevearc/aerial.nvim",
	event = "VeryLazy",
	keys = {
		{ '<leader>a', '<cmd>AerialToggle!<cr>', mode = 'n', desc = "Toggle Aerial" },
		{ '{',         '<cmd>AerialPrev<cr>',    mode = 'n', desc = "Move cursor to Perv navigation" },
		{ '}',         '<cmd>AerialNext<cr>',    mode = 'n', desc = "Move cursor to Next navigation" },
	},
	config = function()
		require("aerial").setup({
			layout = {
				min_width = 30,
			},
			backends = { "lsp", "treesitter", "markdown" },
			filter_kind = false,
			nerd_font = "auto",
			update_events = "TextChanged,InsertLeave",
		})
	end
}
