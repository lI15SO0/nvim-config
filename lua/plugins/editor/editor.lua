return {
	{
		"ethanholz/nvim-lastplace",
		config = true
	},
	{
		"ellisonleao/glow.nvim",
		lazy = true,
		ft = {"md", "markdown"},
		config = true
	},
	{
		"ur4ltz/surround.nvim",
		event = {"BufRead", "BufAdd"},
		config = true
	},
	--[[
	{
		"famiu/bufdelete.nvim",
		event = "VeryLazy",
	},
	]]
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
