local api = require('api')
-- nushell
api.lsp.enable_with_filetype(
	{ "racket", "scheme" },
	"LSP_Enable_racket",
	"racket-langserver"
)
