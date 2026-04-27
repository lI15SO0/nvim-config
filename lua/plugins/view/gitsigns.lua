local options = require("core.options")
local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("lewis6991/gitsigns.nvim") },
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
	group = vim.api.nvim_create_augroup("LoadGitsigns", { clear = true }),
	once = true,
	callback = function()
		require("gitsigns").setup({
			signs = {
				add          = { text = '+' },
				change       = { text = '│' },
				delete       = { text = '_' },
				topdelete    = { text = '‾' },
				changedelete = { text = '~' },
				untracked    = { text = '┆' },
			},
			signcolumn = true,
			numhl = true,
			linehl = false,
			word_diff = false,
			watch_gitdir = {
				follow_files = true
			},
			attach_to_untracked = true,
			current_line_blame = false,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = 'eol',
				delay = 1000,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil,
			max_file_length = 40000,
			preview_config = {
				border = options.ui.border,
				style = 'minimal',
				relative = 'cursor',
				row = 0,
				col = 1
			}
		})
	end,
})
