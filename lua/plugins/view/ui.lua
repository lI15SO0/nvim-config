return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = true
	},
--[[
	{
		"folke/which-key.nvim",
		config = true
	},
]]
	{
		"kevinhwang91/nvim-hlslens",
		keys = {
			{ mode = {"n", "v"}, 'n', 'n' },
			{ mode = {"n", "v"}, 'N', 'N' },
			{ mode = {"n", "v"}, '/', '/' },
		},
		config = true
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = {"BufRead", "BufAdd"},
		config = true
	},
	{
		"psliwka/vim-smoothie",
		event = "VeryLazy",
	},
	{
		"RRethy/vim-illuminate",
		event = {"BufRead", "BufAdd"},
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
		event = "VeryLazy",
		config = function ()
			require("colorizer").setup()
		end,
	}
}
