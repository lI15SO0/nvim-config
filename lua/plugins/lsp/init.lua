local api = require("api")

local path="plugins.lsp"
local plugins = {
	"lspconfig",
	"lspui",
	"neodev",
}

return api.plugin.construct(path, plugins)
