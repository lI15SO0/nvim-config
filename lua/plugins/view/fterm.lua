-- https://github.com/numToStr/FTerm.nvim

local options = require("core.options")

return {
	"numToStr/FTerm.nvim",
	keys = {
		{ "<A-i>", function() require("FTerm").toggle() end, mode = { "n", "t" }, desc = "Toggle Term", { silent = true } },
	},
	config = function()
		require 'FTerm'.setup(
			{
				ft = 'FTerm',
				border = options.ui.border,
				auto_close = true,
				hl = 'Normal',
				blend = options.ui.blend,
				dimensions = {
					height = 0.8, -- Height of the terminal window
					width = 0.8, -- Width of the terminal window
					x = 0.5, -- X axis of the terminal window
					y = 0.5, -- Y axis of the terminal window
				},
				clear_env = false,
				env = nil,
				on_exit = nil,
				on_stdout = nil,
				on_stderr = nil,
			})
	end
}
