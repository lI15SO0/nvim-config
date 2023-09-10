local loader = require("api.loader")
loader.safe_requires({
	"core.setting",
	"core.mapping",
	"core.options",
	"core.plugins",
	"commands",
	"autocmd",
})
