local M = {}

function M.add_autocmd(events, func, opts)
	if opts == nil then
		opts = {}
	end

	if type(func) == "string" then
		opts.command = func
	else
		opts.callback = func
	end

	vim.api.nvim_create_autocmd(events, opts)
end

function M.add_autocmds(autocmds)
	for _, i in pairs(autocmds) do
		M.add_autocmd(i.events, i.func, i.opts)
	end
end

function M.add_command(cmd, func, desc, opts)
	if opts == nil then
		opts = {}
	end

	if desc ~= nil then
		opts.desc = desc
	end

	vim.api.nvim_create_user_command(cmd, func, opts)
end

function M.add_commands(cmds)
	for _, i in pairs(cmds) do
		M.add_command(i.cmd, i.func, i.desc, i.opts)
	end
end

return M
