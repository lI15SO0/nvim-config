-- https://github.com/rcarriga/nvim-notify

--[[
	You can configure this plugins by read notify.setup() document.
]]

return {
	"rcarriga/nvim-notify",
	config = function()
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
	end
}
