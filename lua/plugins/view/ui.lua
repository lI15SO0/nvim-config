local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("kevinhwang91/nvim-hlslens") },
	{ src = gh("norcalli/nvim-colorizer.lua") },
})

vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("LoadHlslens", { clear = true }),
	once = true,
	callback = function()
		require("hlslens").setup({
			calm_down = true,
			nearest_only = true,
		})
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufAdd" }, {
	group = vim.api.nvim_create_augroup("LoadColorizer", { clear = true }),
	once = true,
	callback = function()
		require("colorizer").setup()
	end,
})
