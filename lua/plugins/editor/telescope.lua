local api = require("api")
return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make"
			}
		},
		config = function()
			require("telescope").setup {
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					}
				}
			}
			require("telescope").load_extension("fzf")

			local builtin = require("telescope.builtin")
			
			api.map.bulk_regist( {
				{
					mode = {'n'},
					key = '<leader>ff',
					fn = function()
						builtin.find_files()
					end,
					options = {silent = true},
					description = 'use Telescope to find files',
				},
				{
					mode = {'n'},
					key = '<leader>fg',
					fn = function()
						builtin.live_grep()
					end,
					options = {silent = true},
					description = 'use Telescope to find in rg',
				},
				{
					mode = {'n'},
					key = '<leader>fb',
					fn = function()
						builtin.buffers()
					end,
					options = {silent = true},
					description = 'use Telescope to jump buffer',
				},
				{
					mode = {'n'},
					key = '<leader>fh',
					fn = function()
						builtin.help_tags()
					end,
					options = {silent = true},
					description = 'use Telescope to show help page',
				},
				{
					mode = {'n'},
					key = '<leader>fo',
					fn = function()
						builtin.oldfile()
					end,
					options = {silent = true},
					description = 'use Telescope to find recent open file',
				},
				{
					mode = {'n'},
					key = '<leader>fm',
					fn = function()
						builtin.marks()
					end,
					options = {silent = true},
					description = 'use Telescope to find marks',
				},
				{
					mode = {"n"},
					key = "<leader>fn",
					fn = function ()
						require("telescope").extensions.notify.notify()
					end,
					options = { silent = true },
					description = "Show notices history"
				},
			})
			end
	}
}
