local api = require("api")

local path = "plugins.completion"
local plugins = {
	"blink"
}

api.loader.safe_requires_with_prefix(path, plugins)
