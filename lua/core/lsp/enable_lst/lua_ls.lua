local api = require('api')
-- lua_ls
api.lsp.enable_with_filetype(
	"lua",
	"LSP_Enable_lua_ls",
	function()
		require("lazydev").setup({
			library = {
				{ path = "${3rd}/luv/library",        words = { "vim%.uv" } },
				{ path = "xmake-luals-addon/library", files = { "xmake.lua" } },
			}
		})

		vim.lsp.enable("lua_ls")
	end
)
