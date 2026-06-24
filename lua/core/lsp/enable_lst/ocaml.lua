local api = require('api')
-- zls
api.lsp.enable_with_filetype(
  { 'ocaml', 'menhir', 'ocamlinterface', 'ocamllex', 'reason', 'dune' },
  "LSP_Enable_ocaml",
  "ocamllsp"
)
