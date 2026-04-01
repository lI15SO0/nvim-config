local plugin_types = {
	"plugins/lib",
	"plugins/completion",
	"plugins/dap",
	"plugins/editor",
	"plugins/lsp",
	"plugins/treesitter",
	"plugins/view",
}

local api = require("api")
local loader = api.loader
loader.safe_requires(plugin_types)
