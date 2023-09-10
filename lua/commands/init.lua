local api = require("api")

local cmds = api.loader.safe_requires{
	bufdel = "commands.Bufdel",
	MakeDirectory = "commands.MakeDirectory",
}

api.command.add_commands {
	{
		cmd = "BufferDelete",
		func = cmds.bufdel,
		desc = "Delete the current Buffer while maintaining the window layout"
	},
	{
		cmd = "MakeDirectory",
		func = cmds.MakeDirectory,
		desc = "Create directory if it doesn't exist"
	}
}
