local options = require("core.options")
local M = {}

M.colorscheme = "oxfist/night-owl.nvim"

M.config = function()
	require("night-owl").setup {
		-- These are the default settings
		bold = true,
		italics = true,
		underline = true,
		undercurl = true,
		transparent_background = options.transparent
	}
	vim.cmd("colorscheme night-owl")
end

return M
