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
		rhs = function()
			toggleterm.toggle(nil, nil, nil, "float", nil)
		end
	},
	{
		mod = { "n", "v", "t" },
		lhs = "<A-o>",
		rhs = function()
			local mode = vim.fn.mode()
			local send_mod = "single_line"

			local trim_space = true

			if mode == 'v' then
				send_mod = 'visual_selection'
			elseif mode == 'V' then
				send_mod = 'visual_lines'
			elseif mode == '\22' then
				trim_space = false
				send_mod = 'visual_selection'
			end

			toggleterm.send_lines_to_terminal(send_mod, trim_space, { args = vim.v.count })
			toggleterm.toggle(nil, nil, nil, "horizontal", nil)
		end
	}
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
