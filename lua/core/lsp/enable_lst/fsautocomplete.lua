local api = require('api')
-- fsautocomplete
api.lsp.enable_with_filetype(
  { "fsharp", "fs" },
  "LSP_Enable_fsautocomplete",
  "fsautocomplete"
)
