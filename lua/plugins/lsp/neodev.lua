local api = require("api")

return {
	{
		"folke/neodev.nvim",
		lazy = true,
		ft = "lua",
		config = true,
	},
	{
		"rafcamlet/nvim-luapad",
		lazy = true,
		ft = "lua",
		config = function()

			local autocmd = {
				events = "BufRead",
				func = function()
					if vim.bo.filetype == "lua" then
						local luapad = require('luapad.evaluator'):new { buf = vim.api.nvim_get_current_buf() }
						luapad:start()
						luapad:eval()
						-- vim.notify("Started luapad.", vim.log.levels.INFO)
					end
				end,
			}

			api.command.reg_autocmd(autocmd)
		end,
	}
}
