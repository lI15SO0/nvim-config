local api = require('api')
-- racket
api.lsp.enable_with_filetype(
	{ "racket", "scheme" },
	"LSP_Enable_racket",
	"racket-langserver"
)
