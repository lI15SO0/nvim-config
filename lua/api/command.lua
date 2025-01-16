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

-- NOTE: Remove at 2025-01-19
function M.add_autocmd(events, func, opts)
	vim.notify("This function was no longger maintained, and will removed at 2025-01-19 , use reg_autocmd instade."
		, vim.log.levels.WARN, { title = "api.command.add_autocmd" })
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

-- NOTE: Remove at next version
function M.add_autocmds(autocmds)
	vim.notify("This function was no longger maintained, and will removed at 2025-01-19, use reg_autocmds instade."
		, vim.log.levels.WARN, { title = "api.command.add_autocmds" })
	for _, i in pairs(autocmds) do
		M.add_autocmd(i.events, i.func, i.opts)
	end
end

-- NOTE: Remove at next version
function M.add_command(cmd, func, desc, opts)
	vim.notify("This function was no longger maintained, and will removed at 2025-01-19, use reg_command instade."
		, vim.log.levels.WARN, { title = "api.command.add_command" })
	if opts == nil then
		opts = {}
	end

	if desc ~= nil then
		opts.desc = desc
	end

	vim.api.nvim_create_user_command(cmd, func, opts)
end

-- NOTE: Remove at next version
function M.add_commands(cmds)
	vim.notify("This function was no longger maintained, and will removed at 2025-01-19, use reg_commands instade."
		, vim.log.levels.WARN, { title = "api.command.add_commands" })
	for _, i in pairs(cmds) do
		M.add_command(i.cmd, i.func, i.desc, i.opts)
	end
end

return M
