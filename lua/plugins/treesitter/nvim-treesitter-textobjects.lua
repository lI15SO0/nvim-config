local api = require("api")

require("nvim-treesitter-textobjects").setup {
	select = {
		lookahead = true,
		selection_modes = {
			['@parameter.outer'] = 'v', -- charwise
			['@function.outer'] = 'V', -- linewise
			['@class.outer'] = '<c-v>', -- blockwise
		},
	},
	include_surrounding_whitespace = false,
	move = {
		-- whether to set jumps in the jumplist
		set_jumps = true,
	},
}

local move = require("nvim-treesitter-textobjects.move")

api.map.bulk_regist({
	-- Textobject selections
	{
		mode = { "x", "o" },
		key = "af",
		fn = function()
			require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
		end,
		options = { silent = true },
		description = "Select outer function",
	},
	{
		mode = { "x", "o" },
		key = "if",
		fn = function()
			require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
		end,
		options = { silent = true },
		description = "Select inner function",
	},
	{
		mode = { "x", "o" },
		key = "ac",
		fn = function()
			require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
		end,
		options = { silent = true },
		description = "Select outer class",
	},
	{
		mode = { "x", "o" },
		key = "ic",
		fn = function()
			require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
		end,
		options = { silent = true },
		description = "Select inner class",
	},
	{
		mode = { "x", "o" },
		key = "as",
		fn = function()
			require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
		end,
		options = { silent = true },
		description = "Select local scope",
	},

	-- Next start jumps
	{
		mode = { "n", "x", "o" },
		key = "]m",
		fn = function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
		end,
		options = { silent = true },
		description = "Jump to next function start",
	},
	{
		mode = { "n", "x", "o" },
		key = "]]",
		fn = function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
		end,
		options = { silent = true },
		description = "Jump to next class start",
	},
	{
		mode = { "n", "x", "o" },
		key = "]o",
		fn = function()
			move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
		end,
		options = { silent = true },
		description = "Jump to next loop start",
	},
	{
		mode = { "n", "x", "o" },
		key = "]s",
		fn = function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
		end,
		options = { silent = true },
		description = "Jump to next local scope start",
	},
	{
		mode = { "n", "x", "o" },
		key = "]z",
		fn = function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
		end,
		options = { silent = true },
		description = "Jump to next fold start",
	},

	-- Next end jumps
	{
		mode = { "n", "x", "o" },
		key = "]M",
		fn = function()
			require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
		end,
		options = { silent = true },
		description = "Jump to next function end",
	},
	{
		mode = { "n", "x", "o" },
		key = "][",
		fn = function()
			require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
		end,
		options = { silent = true },
		description = "Jump to next class end",
	},

	-- Previous start jumps
	{
		mode = { "n", "x", "o" },
		key = "[m",
		fn = function()
			require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
		end,
		options = { silent = true },
		description = "Jump to previous function start",
	},
	{
		mode = { "n", "x", "o" },
		key = "[[",
		fn = function()
			require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
		end,
		options = { silent = true },
		description = "Jump to previous class start",
	},

	-- Previous end jumps
	{
		mode = { "n", "x", "o" },
		key = "[M",
		fn = function()
			require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
		end,
		options = { silent = true },
		description = "Jump to previous function end",
	},
	{
		mode = { "n", "x", "o" },
		key = "[]",
		fn = function()
			require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
		end,
		options = { silent = true },
		description = "Jump to previous class end",
	},

	-- Conditional jumps
	{
		mode = { "n", "x", "o" },
		key = "]c",
		fn = function()
			require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
		end,
		options = { silent = true },
		description = "Jump to next conditional start",
	},
	{
		mode = { "n", "x", "o" },
		key = "[c",
		fn = function()
			require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
		end,
		options = { silent = true },
		description = "Jump to previous conditional start",
	},
})
