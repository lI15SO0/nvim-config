-- Option variable

local api = require("api")

local options = {}

options.ui = {}
options.ui.header = {
	"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
	"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
	"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
	"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
	"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
	"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
	"",
	"               ::Easy way to edit::               ",
}

options.transparent = true
options.float_border = false
options.blend = 30
options.show_winbar = true
-- double、rounded、single、shadow、none
options.border = "shadow"

options.download_source = "https://github.com/"

options.lint_directory = api.path.join(vim.fn.stdpath("config"), "lint")
options.undotree_dir = "~/.cache/nvim/undodir"
vim.g.undotree_dir = options.undotree_dir


options.autosave = true
options.auto_restore_cursor_position = true

options.color = {}
options.color.schema = {
	"#39E59E",
	"#F2C85A",
	"#F477F4",
	"#B97BF8",
	"#2563EB",
	"#0000AA",
}
options.color.Error = options.color.schema[3]
options.color.Warning = options.color.schema[2]
options.color.Information = options.color.schema[4]
options.color.Info = options.color.Information
options.color.Hint = options.color.schema[1]
options.color.OK = options.color.Hint
options.color.Note = options.color.schema[5]
options.color.Hack = options.color.schema[6]

options.snip = {}
options.snip.paths = {}


return options
