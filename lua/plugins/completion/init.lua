
local api = require("api")

local path="plugins.completion"
local plugins = {
	-- "nvim-cmp",
	"blink"
}

return api.plugin.construct(path, plugins)
