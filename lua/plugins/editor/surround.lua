local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("kylechui/nvim-surround") }
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufAdd" }, {
	group = vim.api.nvim_create_augroup("LoadSurround", { clear = true }),
	once = true,
	callback = function()
		vim.g.nvim_surround_no_normal_mappings = true
		vim.g.nvim_surround_no_visual_mappings = true

		local surround = require("nvim-surround")

		surround.setup {
			surrounds = {
				["("] = { add = { "(", ")" } },
				[")"] = { add = { "(", ")" } },
				["["] = { add = { "[", "]" } },
				["]"] = { add = { "[", "]" } },
				["{"] = { add = { "{", "}" } },
				["}"] = { add = { "{", "}" } },
				["<"] = { add = { "<", ">" } },
				[">"] = { add = { "<", ">" } },
				["q"] = { add = { "'", "'" } },
				["Q"] = { add = { '"', '"' } },
				["b"] = { add = {"(", ")"} },
				["B"] = { add = {"{", "}"} },
				["l"] = { add = {"[", "]"} },
				["t"] = { add = {"<", ">"} },
			},
			aliases = {
				q = { '"', "'", '`' },
				Q = { '"' },
				b = { '(', '[', '{' },
				B = { '{' },
			}
		}

		api.map.bulk_regist({
			{
				mode = { 'n' },
				key = 'sa',
				fn = "<Plug>(nvim-surround-normal)",
				options = { silent = true },
				description = 'use Telescope to find files',
			},
			{
				mode = { 'x' },
				key = 's',
				fn = "<Plug>(nvim-surround-visual)",
				options = { silent = true },
				description = 'use Telescope to find files',
			},
			{
				mode = { 'n' },
				key = 'sd',
				fn = "<Plug>(nvim-surround-delete)",
				options = { silent = true },
				description = 'use Telescope to find files',
			},
			{
				mode = { 'n' },
				key = 'sr',
				fn = "<Plug>(nvim-surround-change)",
				options = { silent = true },
				description = 'use Telescope to find files',
			},
		})
	end,
})
