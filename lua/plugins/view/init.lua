local api = require("api")

local path = "plugins.view"
local plugins = {
	"theme",
	"ui",
	"aerial",
	"alpha",
	"buffline",
	"gitsigns",
	"indent-blankline",
	"nvim-notify",
	"oil",
	"todo-comments",
	"toggleterm",
	"undotree",
}

api.loader.safe_requires_with_prefix(path, plugins)
