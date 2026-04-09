local api = require('api')

local cmds = api.loader.safe_requires_with_prefix('commands', {
	bufdel = 'Bufdel',
	MakeDirectory = 'MakeDirectory',
	PackUpdate = 'PackUpdate',
	PackPurge = 'PackPurge'
})

api.command.reg_commands(cmds)
