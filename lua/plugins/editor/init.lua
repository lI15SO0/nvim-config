local api = require("api")

local path="plugins.editor"
local plugins = {
	"editor",
	"telescope",
	"auto-save",
	"flash",
	"switch",
	"window-picker",
	"nvim-spectre",
	"mini",
}

return api.plugin.construct(path, plugins)
