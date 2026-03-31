local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("folke/flash.nvim") },
})

local keymaps = {
	{
		mod = { "n", "x", "o" },
		lhs = "e",
		rhs = function() require("flash").jump() end,
		opts = { desc = "Flash" }
	},
	{
		mod = { "n", "x", "o" },
		lhs = "E",
		rhs = function() require("flash").treesitter() end,
		opts = { desc = "Flash Treesitter" }
	},
	{
		mod = { "x", "o" },
		lhs = "R",
		rhs = function() require("flash").treesitter_search() end,
		opts = { desc = "Treesitter Search" }
	},
	{
		mod = { "c" },
		lhs = "<c-s>",
		rhs = function() require("flash").toggle() end,
		opts = { desc = "Toggle Flash Search" }
	},
}

api.plugin.keys_setup("flash", keymaps, {
	modes = {
		char = {
			enabled = false,
		}
	}
})
