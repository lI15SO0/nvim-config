-- https://github.com/nvim-treesitter/nvim-treesitter
local options = require("core.options")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"p00f/nvim-ts-rainbow",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		event = {"BufRead", "BufAdd"},

		main = "nvim-treesitter.configs",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {"markdown", "markdown_inline"},
			ignore_install = nil,
			highlight = {
				enable = true,
				-- additional_vim_regex_highlighting = false, -- change: spellsitter
			},
			indent = {
				enable = true,
				disable = { "yaml", "python", "html", "vue" },
			},
			-- incremental selection
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<cr>",
					node_incremental = "<cr>",
					node_decremental = "<bs>",
					scope_incremental = "<tab>",
				},
			},
			-- nvim-ts-rainbow
			rainbow = {
				enable = true,
				extended_mode = true,
				-- Do not enable for files with more than 1000 lines, int
				max_file_lines = nil,
			},
			-- nvim-ts-autotag
			autotag = {
				enable = true,
			},
			-- nvim-ts-context-commentstring
			context_commentstring = {
				enable = true,
				-- enable_autocmd = false,
			},
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

		}
	}
}

