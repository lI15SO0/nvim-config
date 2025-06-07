local api = require("api")

local path="plugins.lsp"
local plugins = {
	"lspui",
	"lazydev"
}

return api.plugin.construct(path, plugins)
