local api = require("api")

vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		vim.cmd.packadd("nvim.undotree")

		api.map.register({
			mode = { 'n' },
			key = '<leader>2',
			fn = "<cmd>Undotree<CR>",
			options = { silent = true },
			description = "Toggle undotree",
		})

	end,
})
