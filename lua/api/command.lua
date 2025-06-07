local M = {}

function M.reg_autocmd(autocmd)
	if autocmd.opts == nil then
		autocmd.opts = {}
	end

	if type(autocmd.func) == "string" then
		autocmd.opts.command = autocmd.func
	else
		autocmd.opts.callback = autocmd.func
	end

	vim.api.nvim_create_autocmd(autocmd.events, autocmd.opts)
end

function M.reg_autocmds(autocmds)
	for _, autocmd in pairs(autocmds) do
		M.add_autocmd(autocmd)
	end
end

function M.reg_command(cmd)
	if cmd.opts == nil then
		cmd.opts = {}
	end

	if cmd.desc ~= nil then
		cmd.opts.desc = cmd.desc
	end

	vim.api.nvim_create_user_command(cmd.cmd, cmd.func, cmd.opts)
end

function M.reg_commands(cmds)
	for _, cmd in pairs(cmds) do
		M.reg_command(cmd)
	end
end

return M
