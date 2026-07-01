local api = require('api')

local lsps = {
	"ty",
	"ruff"
}

api.lsp.enable_with_filetype(
	{ "python" },
	"LSP_Enable_python",
	function()
		for _, value in pairs(lsps) do
			vim.lsp.enable(value)
		end
	end
)
