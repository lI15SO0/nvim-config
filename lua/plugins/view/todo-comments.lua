-- https://github.com/folke/todo-comments.nvim
local api = require("api")
local gh = api.plugin.gh
local options = require("core.options")

vim.pack.add({
	{ src = gh("folke/todo-comments.nvim") },
})

vim.api.nvim_create_autocmd('VimEnter', {
	group = vim.api.nvim_create_augroup("LoadTodoComments", { clear = true }),
	once = true,
	callback = function()
		require("todo-comments").setup({
			keywords = {
				FIX = {
					icon = " ",
					color = options.color.Error,
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "!" }
				},
				TODO = { icon = " ", color = options.color.OK },
				HACK = { icon = " ", color = options.color.Hack },
				WARN = { icon = " ", color = options.color.Warning, alt = { "WARNING", "XXX" } },
				PERF = { icon = "󰓅 ", color = options.color.Hint, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = options.color.Information, alt = { "INFO" } },
				LABEL = { icon = "󰌕", color = options.color.LABEL, alt = { "LB" } },
				CAUTION = { icon = " ", color = options.Information }
			}
		})

		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", {
			silent = true,
			desc = "Toggle telescope to search TODO Note"
		})
	end,
})
