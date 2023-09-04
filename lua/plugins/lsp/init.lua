local api = require("api")

local path="plugins.lsp"
local plugins = {
	"lspconfig",
	"lspui",
}

return api.plugin.construct(path, plugins)
