local loader = require("api.loader")

local lsp_lst = {
	"clangd",
	"csharp-ls",
	"cssls",
	"fsautocomplete",
	"glsl_analyzer",
	"htmlls",
	"jsonls",
	"lua_ls",
	"neocmake",
	"nushell",
	"rust_analyzer",
	"slangd",
	"yamlls",
	"zls",
}

loader.safe_requires_with_prefix("core.lsp.enable_lst", lsp_lst)
