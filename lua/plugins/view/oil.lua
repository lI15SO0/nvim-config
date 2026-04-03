local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("stevearc/oil.nvim") },
	{ src = gh("JezerM/oil-lsp-diagnostics.nvim") },
	{ src = gh("malewicz1337/oil-git.nvim") },
})

local oil = require('oil')

local keymaps = {
	{
		mod = "n",
		lhs = "<leader>o",
		rhs = function()
			oil.open(nil, { preview = { split = "belowright" } })
		end,
		opts = { desc = "Open oil" }
	},
	{
		mod = "n",
		lhs = "<leader>1",
		rhs = function()
			oil.toggle_float(nil, { preview = {} })
		end,
		opts = { desc = "Toggle oil float" }
	},
}

local setup = function()
	require("oil-lsp-diagnostics").setup {}
	require("oil").setup { float = { preview_split = 'right' } }
end

api.plugin.keys_setup("oil", keymaps, setup)
