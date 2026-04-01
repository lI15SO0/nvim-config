local api = require('api')
-- jsonls
api.lsp.enable_with_filetype(
  { "json", "jsonc" },
  "LSP_Enable_jsonls",
  "jsonls"
)
