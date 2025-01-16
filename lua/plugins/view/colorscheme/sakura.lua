local options = require("core.options")
local M = {}

M.colorscheme = "numToStr/Sakura.nvim"

M.config = function()
	require("Sakura").setup {
		transparent = options.ui.transparent
	}

	require("Sakura").load()
end

return M
