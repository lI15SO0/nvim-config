local api = require("api")

local path="plugins.lsp"
local plugins = {
	"lspui",
	"lazydev"
}

api.loader.safe_requires_with_prefix(path, plugins)
