local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("ur4ltz/surround.nvim") }
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufAdd" }, {
	group = vim.api.nvim_create_augroup("LoadSurround", { clear = true }),
	once = true,
	callback = function()
		require("surround").setup({
			space_on_closing_char = true,
		})
	end,
})
