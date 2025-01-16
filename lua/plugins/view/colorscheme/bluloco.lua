local options = require("core.options")
local M = {}

M.colorscheme = "uloco/bluloco.nvim"

M.dependenices = {
	"rktjmp/lush.nvim"
}

M.config = function()
	require("bluloco").setup {
		style       = "auto", -- "auto" | "dark" | "light"
		transparent = options.ui.transparent,
		italics     = false,
		terminal    = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
		guicursor   = true,
	}

	vim.opt.termguicolors = true
	vim.cmd('colorscheme bluloco')
end

return M
