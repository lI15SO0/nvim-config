return {
	--[[
	{
		"folke/which-key.nvim",
		config = true
	},
]]
	{
		"kevinhwang91/nvim-hlslens",
		event = "VeryLazy",
		opts = {
			calm_down = true,
			nearest_only = true,
		}
	},
	{
		"psliwka/vim-smoothie",
		event = "VeryLazy",
	},
	{
		"RRethy/vim-illuminate",
		event = { "BufRead", "BufAdd" },
		config = function()
			require("illuminate").configure({
				providers = {
					'lsp',
					'treesitter',
					'regex',
				},
				delay = 100,
				filetype_overrides = {},
				filetypes_denylist = {
					'dirvish',
					'fugitive',
				},
				filetypes_allowlist = {},
				modes_denylist = {},
				modes_allowlist = {},
				providers_regex_syntax_denylist = {},
				providers_regex_syntax_allowlist = {},
				under_cursor = true,
				large_file_cutoff = nil,
				large_file_overrides = nil,
				min_count_to_highlight = 1,
			})
		end
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = { "BufRead", "BufAdd" },
		config = function()
			require("colorizer").setup()
		end,
	}
}
