return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require('mini.splitjoin').setup()
			require('mini.comment').setup()
			require('mini.ai').setup()
			require('mini.icons').setup()
			require('mini.icons').mock_nvim_web_devicons()
			-- require("mini.pairs").setup()
		end
	}
}
