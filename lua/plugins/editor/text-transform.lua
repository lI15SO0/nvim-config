local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("chenasraf/text-transform.nvim") },
})

local keymaps = {
	{
		mod = { "n", "v" },
		lhs = "<Leader>w",
		rhs = function() vim.cmd("TextTransform") end,
		opts = { silent = true, desc = "Transform text via different transformer." }
	},
}

api.plugin.keys_setup("text-transform", keymaps, {
	keymap = {
		["n"] = "<Leader>w",
		["v"] = "<Leader>w",
	},
})
