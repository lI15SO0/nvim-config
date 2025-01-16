local options = require("core.options")
local M = {}

M.colorscheme = "Shatur/neovim-ayu"

M.config = function()
	local opt = {}
	if options.ui.transparent then
		opt = {
			mirage = false,
			terminal = true,
			overrides = {
				Normal = { bg = "None" },
				ColorColumn = { bg = "None" },
				SignColumn = { bg = "None" },
				Folded = { bg = "None" },
				FoldColumn = { bg = "None" },
				CursorLine = { bg = "None" },
				CursorColumn = { bg = "None" },
				WhichKeyFloat = { bg = "None" },
				VertSplit = { bg = "None" },
			}
		}
	else
		opt = {
			mirage = false,
			terminal = true
		}
	end

	require("ayu").setup(opt)

	vim.cmd("colorscheme ayu")
end

return M
