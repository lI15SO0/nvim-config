local api = require("api")

local path="plugins.editor"
local plugins = {
	"editor",
	"telescope",
	-- "flash",
	"switch",
	"window-picker",
	"nvim-spectre",
	"mini",
	"text-transform",
	"tabset_nvim",
	"insx"
}

return api.plugin.construct(path, plugins)
