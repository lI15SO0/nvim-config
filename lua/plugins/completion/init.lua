
local api = require("api")

local path="plugins.completion"
local plugins = {
	"nvim-cmp",
}

return api.plugin.construct(path, plugins)
