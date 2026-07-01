local api = require('api')
-- deno
api.lsp.enable_with_filetype(
	{
		'javascript',
		'javascriptreact',
		'typescript',
		'typescriptreact',
	},
	"LSP_Enable_deno",
	"deno"
)
