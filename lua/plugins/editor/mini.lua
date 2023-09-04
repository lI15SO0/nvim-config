return {
	{
		"echasnovski/mini.nvim",
		event = "VeryLazy",
		config = function()
			require('mini.splitjoin').setup()
			require('mini.comment').setup()
			require('mini.ai').setup()
		end
	}
}
