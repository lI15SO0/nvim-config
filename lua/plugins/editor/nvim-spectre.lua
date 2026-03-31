-- https://github.com/nvim-pack/nvim-spectre
local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("nvim-pack/nvim-spectre") },
})

local keymaps = {
	{
		mod = "n",
		lhs = "<leader>rp",
		rhs = function() require("spectre").open() end,
		opts = { silent = true, desc = "Open Spectre" }
	},
	{
		mod = "n",
		lhs = "<leader>rf",
		rhs = function() require("spectre").open_file_search() end,
		opts = { silent = true, desc = "Search in current file" }
	},
	{
		mod = "n",
		lhs = "<leader>rw",
		rhs = function() require("spectre").open_visual({ select_word = true }) end,
		opts = { silent = true, desc = "Search current word" }
	},
}

api.plugin.keys_setup("spectre", keymaps, {
	mapping = {
		["toggle_line"] = {
			map = "dd",
			cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
			desc = "toggle current item"
		},
		["enter_file"] = {
			map = "<CR>",
			cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
			desc = "goto current file"
		},
		["show_option_menu"] = {
			map = "<leader>o",
			cmd = "<cmd>lua require('spectre').show_options()<CR>",
			desc = "show option"
		},
		["run_replace"] = {
			map = "<leader>r",
			cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
			desc = "replace all"
		},
		["change_view_mode"] = {
			map = "<leader>v",
			cmd = "<cmd>lua require('spectre').change_view()<CR>",
			desc = "change result view mode"
		}
	}
})
