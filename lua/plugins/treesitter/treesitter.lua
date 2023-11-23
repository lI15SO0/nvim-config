---@diagnostic disable: missing-fields
-- https://github.com/nvim-treesitter/nvim-treesitter
local options = require("core.options")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"HiPhish/rainbow-delimiters.nvim",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		event = { "BufRead", "BufAdd" },

		main = "nvim-treesitter.configs",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.install").prefer_git = true
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "markdown", "markdown_inline", 'lua' },
				ignore_install = {},
				highlight = {enable = true,},
				indent = {
					enable = true,
					disable = { "yaml", "python", "html", "vue" },
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<cr>",
						node_incremental = "<cr>",
						node_decremental = "<bs>",
						scope_incremental = "<tab>",
					},
				},
				autotag = {enable = true,},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
						},
						selection_modes = {
							['@parameter.outer'] = 'v', -- charwise
							['@function.outer'] = 'V', -- linewise
							['@class.outer'] = '<c-v>', -- blockwise
						},
						include_surrounding_whitespace = false,
					},

				},
			})
		end
	}
}
