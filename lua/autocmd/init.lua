local api = require("api")

local cmds = api.loader.safe_requires {
	autosave = "autocmd.autosave",
	lastplace = "autocmd.lastplace",
	disable_new_annotation_line = "autocmd.DisableNewLineAnnotation"
}

api.command.add_autocmds({
	{
		events = { "InsertLeave", "TextChanged" },
		func = cmds.autosave
	},
	{
		events = "BufReadPost",
		func = cmds.lastplace
	},
	{
		events = "BufEnter",
		func = cmds.disable_new_annotation_line
	}
})

