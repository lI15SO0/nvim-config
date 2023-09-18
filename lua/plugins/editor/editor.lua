return {
	{
		"ellisonleao/glow.nvim",
		lazy = true,
		ft = {"md", "markdown"},
		config = true
	},
	{
		"ur4ltz/surround.nvim",
		event = {"BufReadPost", "BufAdd"},
		config = true
	},
	--[[
	{
		"lewis6991/spellsitter.nvim",
		event = "VeryLazy",
		config = function()
			require("spellsitter").setup {
				enable = true,
				debug = false
			}
		end
	},
	]]
}
