-- https://github.com/numToStr/FTerm.nvim
local api = require("api")
local gh = api.plugin.gh
local options = require("core.options")

vim.pack.add({
	{ src = gh("numToStr/FTerm.nvim") },
})

local keymaps = {
	{
		mod = { "n", "t" },
		lhs = "<A-i>",
		rhs = function() require("FTerm").toggle() end,
		opts = { silent = true, desc = "Toggle Term" }
	},
}

local opts = {
	ft = 'FTerm',
	border = options.ui.border,
	auto_close = true,
	hl = 'Normal',
	blend = options.ui.blend,
	dimensions = {
		height = 0.8,
		width = 0.8,
		x = 0.5,
		y = 0.5,
	},
	clear_env = false,
	env = nil,
	on_exit = nil,
	on_stdout = nil,
	on_stderr = nil,
}

api.plugin.keys_setup("FTerm", keymaps, opts)
