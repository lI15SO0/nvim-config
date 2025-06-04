local api = require("api")

local path="plugins.lsp"
local plugins = {
	"lspui",
}

return api.plugin.construct(path, plugins)
