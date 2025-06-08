local api = require("api")
local options = require("core.options")

-- TODO: refact this: to fit augroup arg.

local cmds = api.loader.safe_requires {
	autosave = "autocmd.autosave",
	lastplace = "autocmd.lastplace",
	disable_new_annotation_line = "autocmd.DisableNewLineAnnotation"
}

for i, x in pairs(cmds) do
	if options.autocmd[i] == true then
		api.command.reg_autocmd(x)
	end
end
