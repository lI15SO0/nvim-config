local loader = require("api.loader")
loader.safe_requires({
	"core.setting",
	"core.options",
	"core.mapping",
	"core.plugins",
	"commands",
	"autocmd",
})
