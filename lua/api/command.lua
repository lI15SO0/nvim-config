local M = {}

---EZ register command.
---@param cmd table
function M.reg_command(cmd)
	if cmd.opts == nil then
		cmd.opts = {}
	end

	if cmd.desc ~= nil then
		cmd.opts.desc = cmd.desc
	end

	vim.api.nvim_create_user_command(cmd.cmd, cmd.func, cmd.opts)
end

---EZ register commands.
---@param cmds table
function M.reg_commands(cmds)
	for _, cmd in pairs(cmds) do
		M.reg_command(cmd)
	end
end

return M
