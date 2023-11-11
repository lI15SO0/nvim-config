return {
	{
		"echasnovski/mini.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require('mini.ai').setup()
		end
	}
}
