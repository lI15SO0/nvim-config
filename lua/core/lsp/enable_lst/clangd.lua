local api = require('api')
-- clangd
api.lsp.enable_with_filetype(
	{ "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	"LSP_Enable_clangd",
	"clangd"
)
