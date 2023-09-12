local api = require("api")

local cmds = api.loader.safe_requires {
	autosave = "autocmd.autosave",
	lastplace = "autocmd.lastplace",
	disable_new_annotation_line = "autocmd.DisableNewLineAnnotation"
}

api.command.add_autocmds({
	{
		events = { "InsertLeave", "TextChanged" },
		func = cmds.autosave,
		opts = { nested = true, desc = "Auto save file when Text changed or Leave Insert mode." }
	},
	{
		events = "BufReadPost",
		func = cmds.lastplace,
		opts = { desc = "Back to lasat place." }
	},
	{
		events = "BufEnter",
		func = cmds.disable_new_annotation_line,
		opts = { desc = "Disable new line auto generate annotation head." }
	}
})
