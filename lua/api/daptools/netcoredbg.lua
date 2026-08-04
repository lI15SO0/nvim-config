local tbl_tools = require('api.tbl')

local M = {}

--- @class netcoredbg_launch_config
--- @field build_cmds string[]?
--- @field program string|function
--- @field args string[]?


--- build netcoredbg config with less args.
--- @param config_name string
--- @param netcoredbg_launch_config netcoredbg_launch_config
--- @param cwd string?
--- @return dap.Configuration?
function M.make_launch_config(config_name, netcoredbg_launch_config, cwd)
	if not netcoredbg_launch_config then
		vim.notify("Error to make netcoredbg launch config: netcoredbg_launch_config must be set", vim.log.levels.ERROR)
		return nil
	end

	if not cwd then
		cwd = '${workspaceFolder}'
	end

	-- package program if is string type
	local program = netcoredbg_launch_config.program
	if type(program) == 'string' then
		local program_name = program
		program = function()
			-- Get all cmds we need.
			local build_cmds = tbl_tools.ensurce_table_exist(netcoredbg_launch_config.build_cmds)

			-- execute cmds.
			if #build_cmds ~= 0 then
				local output = vim.fn.system(build_cmds)
				if vim.v.shell_error ~= 0 then
					vim.notify('Build project failed: ' .. output, vim.log.levels.ERROR)
					return nil
				end
			end

			-- return program
			return program_name
		end
	end

	-- return configure
	return {
		type = 'netcoredbg',
		request = 'launch',
		name = config_name,
		cwd = cwd,
		stopAtEntry = false,
		program = program,
		args = tbl_tools.ensurce_table_exist(netcoredbg_launch_config.args),
	}
end

--- @class netcoredbg_attach_config
--- @field program (string|function)?
--- @field args string[]?
--- @field pid (number|function)?
--- @field attach_commands (string|function)?


--- build netcoredbg config with less args.
--- @param config_name string
--- @param netcoredbg_attach_config netcoredbg_attach_config
--- @param cwd string?
--- @return dap.Configuration?
function M.make_attach_config(config_name,netcoredbg_attach_config, cwd)
	if not netcoredbg_attach_config then
		vim.notify("Error to make lldb launch config: lldb_attach_config must be set", vim.log.levels.ERROR)
		return nil
	end

	if not cwd then
		cwd = '${workspaceFolder}'
	end

	-- ensurce attach target exists.
	local error_counter = 0;

	if not netcoredbg_attach_config.pid then error_counter = error_counter + 1 end
	if not netcoredbg_attach_config.attach_commands then error_counter = error_counter + 1 end
	if not netcoredbg_attach_config.program then error_counter = error_counter + 1 end

	if error_counter > 2 then
		error('Either lldb_config member "pid". "attach_commands", "program" must be set')
	end

	-- return configure
	return {
		type = 'netcoredbg',
		request = 'attach',
		name = config_name,
		cwd = cwd,
		stopAtEntry = false,
		program = netcoredbg_attach_config.program,
		args = tbl_tools.ensurce_table_exist(netcoredbg_attach_config.args),
		attachCommands = netcoredbg_attach_config.attach_commands,
		pid = netcoredbg_attach_config.pid,
	}
end

return M
