local api = require("api")
local loader = api.loader
loader.safe_requires({
	"core.options",
	"commands",
	"core.mapping",
	"core.setting",
	"core.plugins",
	"core.folding",
	"core.lsp",
	"autocmd",
})
