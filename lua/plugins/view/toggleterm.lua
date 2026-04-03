-- https://github.com/akinsho/toggleterm.nvim
local api = require("api")
local gh = api.plugin.gh
local options = require("core.options")

vim.pack.add({
	{ src = gh("akinsho/toggleterm.nvim") },
})

local toggleterm = require("toggleterm")

local keymaps = {
	{
		mod = { "n", "i", "v", "t" },
		lhs = "<A-i>",
		rhs = toggleterm.toggle
	},
}


local opts = {
	shell = function()
		local env_shell = vim.fn.getenv("SHELL")

		if env_shell == vim.NIL then
			env_shell = vim.o.shell;
		end
		return env_shell
	end,
	direction = "float"
}

api.plugin.keys_setup("toggleterm", keymaps, opts)
