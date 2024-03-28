local options = require("core.options")

return {
	{
		-- "navarasu/onedark.nvim",
		"EdenEast/nightfox.nvim",
		dependencies = {
			"nvim-lualine/lualine.nvim",
			"nvim-tree/nvim-web-devicons",
			"utilyre/barbecue.nvim",
			"SmiteshP/nvim-navic",
		},
		lazy = false,
		priority = 1000,
		config = function()
			require("nightfox.config").set_fox("duskfox")
			require("nightfox").setup({
				options = { transparent = options.transparent, }
			})
			require("nightfox").load()
			require("lualine").setup()
			require("barbecue").setup()
		end
	}
}
