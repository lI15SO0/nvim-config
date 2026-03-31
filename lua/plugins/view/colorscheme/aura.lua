local options = require("core.options")
local M = {}

M.colorscheme = "daltonmenezes/aura-theme"

M.config = function(plugin)
	vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
	vim.cmd("colorscheme aura-dark")
end

return M
