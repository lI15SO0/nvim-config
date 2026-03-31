local api = require("api")

local cmds = api.loader.safe_requires {
	bufdel = "commands.Bufdel",
	MakeDirectory = "commands.MakeDirectory",
}

api.command.reg_commands(cmds)
