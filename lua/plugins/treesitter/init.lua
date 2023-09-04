local api = require("api")

local path="plugins.treesitter"
local plugins = {
	"treesitter",
}

return api.plugin.construct(path, plugins)
