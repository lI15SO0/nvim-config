local api = require('api')
-- zls
api.lsp.enable_with_filetype(
  { "zig", "zir" },
  "LSP_Enable_zls",
  "zls"
)
