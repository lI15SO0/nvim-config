local api = require('api')
-- htmlls
api.lsp.enable_with_filetype(
  { "html", "templ" },
  "LSP_Enable_htmlls",
  "htmlls"
)
