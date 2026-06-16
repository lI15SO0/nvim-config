local api = require('api')
-- ty
api.lsp.enable_with_filetype(
  "python",
  "LSP_Enable_python",
  "ty"
)

-- ruff
api.lsp.enable_with_filetype(
	{ 'python' },
	"LSP_Enable_python",
	"ruff"
)
