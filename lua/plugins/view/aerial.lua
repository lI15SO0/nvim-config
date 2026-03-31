-- https://github.com/stevearc/aerial.nvim
local api = require("api")
local gh = api.plugin.gh
local options = require("core.options")

vim.pack.add({
	{ src = gh("stevearc/aerial.nvim") },
})

local keymaps = {
	{
		mod = "n",
		lhs = "<leader>a",
		rhs = function() vim.cmd("AerialToggle!") end,
		opts = { desc = "Toggle Aerial" }
	},
	{
		mod = "n",
		lhs = "<leader>s",
		rhs = function() vim.cmd("AerialNavToggle") end,
		opts = { desc = "Toggle Aerial" }
	},
	{
		mod = "n",
		lhs = "{",
		rhs = function() vim.cmd("AerialPrev") end,
		opts = { desc = "Move cursor to Perv navigation" }
	},
	{
		mod = "n",
		lhs = "}",
		rhs = function() vim.cmd("AerialNext") end,
		opts = { desc = "Move cursor to Next navigation" }
	},
}

local opts = {
	layout = {
		min_width = 30,
	},
	backends = { "lsp", "treesitter", "markdown" },
	filter_kind = false,
	nerd_font = "auto",
	update_events = "TextChanged,InsertLeave",
	show_guides = true,
	nav = {
		border = "rounded",
		max_height = 0.9,
		min_height = { 10, 0.7 },
		max_width = 0.3,
		min_width = { 0.3, 20 },
		win_opts = {
			cursorline = true,
			winblend = options.ui.blend,
		},
		autojump = false,
		preview = true,
		keymaps = {
			["<CR>"] = "actions.jump",
			["o"] = "actions.jump",
			["<2-LeftMouse>"] = "actions.jump",
			["<C-v>"] = "actions.jump_vsplit",
			["<C-s>"] = "actions.jump_split",
			["h"] = "actions.left",
			["l"] = "actions.right",
			["<C-c>"] = "actions.close",
			["q"] = "actions.close",
			["<esc>"] = "actions.close",
		}
	}
}

api.plugin.keys_setup("aerial", keymaps, opts)
