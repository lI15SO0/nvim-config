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
	"insx"
}

api.loader.safe_requires_with_prefix(path, plugins)
