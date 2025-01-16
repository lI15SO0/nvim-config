local loader = require("api.loader")
loader.safe_requires({
	"core.options",
	"commands",
	"core.mapping",
	"core.setting",
	"core.plugins",
	"autocmd",
})
