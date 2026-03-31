require("lazydev").setup({
	library = {
		{ path = "${3rd}/luv/library",        words = { "vim%.uv" } },
		{ path = "xmake-luals-addon/library", files = { "xmake.lua" } },
	}
})
vim.lsp.enable("lua_ls")
