
local api = require("api")

local path="plugins.completion"
local plugins = {
	"blink"
}

return api.plugin.construct(path, plugins)
