local api = require("api")

-- clangd
api.lsp.enable_with_filetype(
  { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  "LSP_Enable_clangd",
  "clangd"
)

-- csharp-ls
api.lsp.enable_with_filetype(
  "cs",
  "LSP_Enable_csharp_ls",
  "csharp-ls"
)

-- cssls
api.lsp.enable_with_filetype(
  { "css", "scss", "less" },
  "LSP_Enable_cssls",
  "cssls"
)

-- fsautocomplete
api.lsp.enable_with_filetype(
  { "fsharp", "fs" },
  "LSP_Enable_fsautocomplete",
  "fsautocomplete"
)

-- glsl_analyzer
api.lsp.enable_with_filetype(
  { "glsl", "vert", "tesc", "tese", "frag", "geom", "comp" },
  "LSP_Enable_glsl_analyzer",
  "glsl_analyzer"
)

-- htmlls
api.lsp.enable_with_filetype(
  { "html", "templ" },
  "LSP_Enable_htmlls",
  "htmlls"
)

-- jsonls
api.lsp.enable_with_filetype(
  { "json", "jsonc" },
  "LSP_Enable_jsonls",
  "jsonls"
)

-- lua_ls
api.lsp.enable_with_filetype(
  "lua",
  "LSP_Enable_lua_ls",
  function ()
require("lazydev").setup({
	library = {
		{ path = "${3rd}/luv/library",        words = { "vim%.uv" } },
		{ path = "xmake-luals-addon/library", files = { "xmake.lua" } },
	}
})
	  vim.lsp.enable("lua_ls")
  end
)

-- neocmake
api.lsp.enable_with_filetype(
  "cmake",
  "LSP_Enable_neocmake",
  "neocmake"
)

-- nushell
api.lsp.enable_with_filetype(
  "nu",
  "LSP_Enable_nushell",
  "nushell"
)

-- rust_analyzer
api.lsp.enable_with_filetype(
  "rust",
  "LSP_Enable_rust_analyzer",
  "rust_analyzer"
)

-- slangd
api.lsp.enable_with_filetype(
  { "hlsl", "shaderslang" },
  "LSP_Enable_slangd",
  "slangd"
)

-- yamlls
api.lsp.enable_with_filetype(
  "yaml",
  "LSP_Enable_yamlls",
  "yamlls"
)

-- zls
api.lsp.enable_with_filetype(
  { "zig", "zir" },
  "LSP_Enable_zls",
  "zls"
)
