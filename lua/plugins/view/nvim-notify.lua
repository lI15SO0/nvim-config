-- https://githuloadb.com/rcarriga/nvim-notify

local options = require("core.options")

return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		local notify_options = {
			stages = 'fade_in_slide_out',
			timeout = 3000,
			fps = 60,
		}
		notify.setup(notify_options)
		vim.notify = notify
	end
}
