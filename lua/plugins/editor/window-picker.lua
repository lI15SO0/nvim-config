return {
	-- only needed if you want to use the commands with "_with_window_picker" suffix
	's1n7ax/nvim-window-picker',
	keys = {
		{
			"<c-w>p",
			function()
				local window_number = require("window-picker").pick_window()
				if window_number then vim.api.nvim_set_current_win(window_number) end
			end,
			mode = { "n" },
			desc = "Use window-picker to pick a window.",
			{ silent = true },
		},
	},
	config = function()
		require 'window-picker'.setup({
			filter_rules = {
				include_current = true,
				-- filter using buffer options
				bo = {
					filetype = { 'neo-tree', "neo-tree-popup", "notify", "fidget" },
					buftype = { 'terminal', "quickfix" },
				},
			},
		})

		-- api.map.bulk_regist {
		-- 	{
		-- 		mode = { 'n' },
		-- 		key = '<c-w>p',
		-- 		fn = function()
		-- 			local window_number = require("window-picker").pick_window()
		-- 			if window_number then vim.api.nvim_set_current_win(window_number) end
		-- 		end,
		-- 		options = { silent = true },
		-- 		description = 'Use window-picker to pick a window.',
		-- 	},
		-- }
	end,
}
