return {
	'stevearc/oil.nvim',
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	-- dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	keys = {
		{
			mode = { 'n' },
			'<leader>1',
			'<cmd>Oil<cr>',
			desc = 'Enable Oil',
			{ silent = true }
		}
	},
}
