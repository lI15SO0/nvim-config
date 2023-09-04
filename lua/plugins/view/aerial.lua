-- https://github.com/stevearc/aerial.nvim
return {
	"stevearc/aerial.nvim",
	event = "VeryLazy",
	config = function()
		require("aerial").setup({
			layout = {
				min_width = 30,
			},
			backends = {"lsp", "treesitter", "markdown"},
			filter_kind = false,
			nerd_font = "auto",
			update_events = "TextChanged,InsertLeave",
			on_attach = function(bufnr)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>AerialToggle!<CR>', {})
				vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
				vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})
			end
		})
	end
}
