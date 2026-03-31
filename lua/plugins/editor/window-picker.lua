local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("s1n7ax/nvim-window-picker") },
})

local keymaps = {
	{
		mod = "n",
		lhs = "<c-w>p",
		rhs = function()
			local window_number = require("window-picker").pick_window()
			if window_number then
				vim.api.nvim_set_current_win(window_number)
			end
		end,
		opts = { silent = true, desc = "Use window-picker to pick a window." }
	},
}

api.plugin.keys_setup("window-picker", keymaps, {
	filter_rules = {
		include_current = true,
		bo = {
			filetype = { 'neo-tree', "neo-tree-popup", "notify", "fidget" },
			buftype = { 'terminal', "quickfix" },
		},
	},
})
