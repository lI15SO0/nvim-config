local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("stevearc/oil.nvim") },
	{ src = gh("JezerM/oil-lsp-diagnostics.nvim") },
	{ src = gh("malewicz1337/oil-git.nvim") },
})

vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("LoadOil", { clear = true }),
	once = true,
	callback = function()
		require("oil-lsp-diagnostics").setup {}

		require("oil").setup {}

		vim.keymap.set("n", "<leader>1", "<cmd>Oil<cr>", { silent = true, desc = "Enable Oil" })
	end,
})
