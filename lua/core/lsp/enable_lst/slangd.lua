local api = require('api')
-- slangd
api.lsp.enable_with_filetype(
  { "hlsl", "shaderslang" },
  "LSP_Enable_slangd",
  "slangd"
)
