-- https://github.com/rcarriga/nvim-notify
local api = require("api")
local gh = api.plugin.gh

-- 注册插件
vim.pack.add({
	{ src = gh("rcarriga/nvim-notify") },
})

-- 在 VimEnter 时加载并配置 notify（仅一次）
vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("LoadNotify", { clear = true }),
	once = true,
	callback = function()
		local notify = require("notify")
		local notify_options = {
			stages = 'fade',
			timeout = 100,
			fps = 8,
			top_down = true,
			render = "default",
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "",
				WARN = ""
			},
			background_colour = "#403080"
		}
		notify.setup(notify_options)
		vim.notify = notify
	end,
})
