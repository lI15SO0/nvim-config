return {
	{
		"folke/neodev.nvim",
		lazy = true,
		event = "VeryLazy",
		config = true,
	},
	{
		"rafcamlet/nvim-luapad",
		lazy = true,
		ft = "lua",
		config = function ()
			local api = require("api")
			api.command.add_autocmd(
				{"BufRead", "BufEnter"},
				function ()
					local luapad = require('luapad.evaluator'):new{buf = vim.api.nvim_get_current_buf()}
					luapad:start()
					luapad:eval()
				end
			)
		end,
	}
}
