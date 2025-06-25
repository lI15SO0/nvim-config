return {
	{
		"kevinhwang91/nvim-hlslens",
		keys = {"/", mode = 'n'},
		opts = {
			calm_down = true,
			nearest_only = true,
		}
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = { "BufRead", "BufAdd" },
		config = function()
			require("colorizer").setup()
		end,
	}
}
