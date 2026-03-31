local api = require("api")

local path="plugins.dap"
local plugins = {
	"dap"
}

api.loader.safe_requires_with_prefix(path, plugins)
