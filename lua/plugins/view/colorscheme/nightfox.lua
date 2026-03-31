local options = require("core.options")
local M = {}

M.colorscheme = "EdenEast/nightfox.nvim"

M.config = function()
	require("nightfox.config").set_fox("duskfox")
	require("nightfox").setup({
		options = { transparent = options.ui.transparent, },
	})
	require("nightfox").load()
end

return M
