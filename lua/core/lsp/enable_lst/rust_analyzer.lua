local api = require('api')
-- rust_analyzer
api.lsp.enable_with_filetype(
  "rust",
  "LSP_Enable_rust_analyzer",
  "rust_analyzer"
)
