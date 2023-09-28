return {
	{
		"echasnovski/mini.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require('mini.splitjoin').setup()
			require('mini.comment').setup()
			require('mini.ai').setup()
			require("mini.pairs").setup()
		end
	}
}
