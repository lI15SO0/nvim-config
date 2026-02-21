-- https://github.com/folke/todo-comments.nvim

local options = require("core.options")

return {
	"folke/todo-comments.nvim",
	event = { "BufReadPost", "BufAdd" },
	keys = {
		{ "<leader>ft", "<cmd>TodoTelescope<CR>", mode = { 'n' }, desc = "Toggle telescope to search TODO Note", { silent = true } }
	},
	opts = {
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
	},
}
