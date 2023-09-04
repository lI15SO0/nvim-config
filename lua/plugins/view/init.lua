local api = require("api")

local path="plugins.view"
local plugins = {
	"theme",
	"ui",
	"nvim-notify",
	"todo-comments",
	"aerial",
	"alpha",
	"buffline",
	"neotree",
	"undotree",
	"fterm",
}

return api.plugin.construct(path, plugins)
