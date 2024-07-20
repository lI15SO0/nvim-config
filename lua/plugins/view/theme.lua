local theme = require("plugins.view.colorscheme.sakura")
if theme.dependenices == nil then
	theme.dependenices = {}
end

return {
	{
		theme.colorscheme,
		dependencies = {
			"nvim-lualine/lualine.nvim",
			"nvim-tree/nvim-web-devicons",
			"utilyre/barbecue.nvim",
			"SmiteshP/nvim-navic",
			theme.dependenices
		},
		lazy = false,
		priority = 1000,
		config = function(plugin)
			theme.config(plugin)
			require("lualine").setup()
			require("barbecue").setup()
		end
	}
}
