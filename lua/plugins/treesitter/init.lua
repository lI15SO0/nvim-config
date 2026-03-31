local api = require("api")

local path="plugins.treesitter"
local plugins = {
	"treesitter",
}

api.loader.safe_requires_with_prefix(path, plugins)
