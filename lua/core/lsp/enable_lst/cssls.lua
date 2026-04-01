local api = require('api')
-- cssls
api.lsp.enable_with_filetype(
  { "css", "scss", "less" },
  "LSP_Enable_cssls",
  "cssls"
)
