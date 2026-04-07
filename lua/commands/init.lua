local api = require("api")

local cmds = api.loader.safe_requires_with_prefix('commands', {
	bufdel = "Bufdel",
	MakeDirectory = "MakeDirectory",
	packupdate = "PackUpdate"
})

api.command.reg_commands(cmds)
