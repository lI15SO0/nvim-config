local api = require('api')
-- glsl_analyzer
api.lsp.enable_with_filetype(
  { "glsl", "vert", "tesc", "tese", "frag", "geom", "comp" },
  "LSP_Enable_glsl_analyzer",
  "glsl_analyzer"
)
