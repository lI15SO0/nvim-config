local tbl_tools = require('api.tbl')

local M = {}


--- @class lldb_config
--- @field config_cmds string[]?
--- @field build_cmds string[]?
--- @field source_maps table?
--- @field init_commands string[]?

--- @class lldb_launch_config : lldb_config
--- @field program string|function
--- @field args string[]?

--- @class lldb_attach_config : lldb_config
--- @field program (string|function)?
--- @field args string[]?
--- @field pid (number|function)?
--- @field attach_commands (string|function)?
--- @field wait_for boolean?

--- build python config with less args.
--- @param config_name string
--- @param lldb_launch_config lldb_launch_config
--- @param cwd string?
--- @return dap.Configuration?
function M.make_launch_config(config_name, lldb_launch_config, cwd)
	-- ensure lldb_launch_config exist.
	if not lldb_launch_config then
		vim.notify("Error to make lldb launch config: lldb_launch_config must be set", vim.log.levels.ERROR)
		return nil
	end

	if not cwd then
		cwd = '${workspaceFolder}'
	end

	-- A tool function to help execute cmds
	local execute_cmds = function(cmds, err_notify)
		if cmds and #cmds ~= 0 then
			local output = vim.fn.system(cmds)
			if vim.v.shell_error ~= 0 then
				vim.notify(err_notify .. output, vim.log.levels.ERROR)
				return nil
			end
		end
		return {}
	end

	-- package program if is string type
	local program = lldb_launch_config.program
	if type(program) == 'string' then
		local program_name = program
		program = function()
			-- Get all cmds we need.
			local config_cmds = tbl_tools.ensurce_table_exist(lldb_launch_config.config_cmds)
			local build_cmds = tbl_tools.ensurce_table_exist(lldb_launch_config.build_cmds)

			-- execute cmds.
			if not execute_cmds(config_cmds, 'Configuration project failed: ') then
				return nil
			end

			if not execute_cmds(build_cmds, 'Build project failed: ') then
				return nil
			end

			-- return program
			return program_name
		end
	end

	-- return configure
	return {
		type = 'lldb-dap',
		request = 'launch',
		name = config_name,
		cwd = cwd,
		stopOnEntry = false,
		sourceMap = tbl_tools.ensurce_table_exist(lldb_launch_config.source_maps),
		initCommands = tbl_tools.ensurce_table_exist(lldb_launch_config.init_commands),
		program = program,
		args = tbl_tools.ensurce_table_exist(lldb_launch_config.args),
	}
end

--- build python config with less args.
--- @param config_name string
--- @param lldb_attach_config lldb_attach_config
--- @param cwd string?
--- @return dap.Configuration?
function M.make_attach_config(config_name, lldb_attach_config, cwd)
	-- ensure lldb_attach_config exist.
	if not lldb_attach_config then
		vim.notify("Error to make lldb launch config: lldb_attach_config must be set", vim.log.levels.ERROR)
		return nil
	end

	if not cwd then
		cwd = '${workspaceFolder}'
	end

	if lldb_attach_config.wait_for == nil then lldb_attach_config.wait_for = false end

	-- ensurce attach target exists.
	local error_counter = 0;

	if not lldb_attach_config.pid then error_counter = error_counter + 1 end
	if not lldb_attach_config.attach_commands then error_counter = error_counter + 1 end
	if not lldb_attach_config.program then error_counter = error_counter + 1 end

	if error_counter > 2 then
		error('Either lldb_config member "pid". "attach_commands", "program" must be set')
	end

	-- return configure
	return {
		type = 'lldb-dap',
		request = 'attach',
		name = config_name,
		cwd = cwd,
		stopOnEntry = false,
		sourceMap = tbl_tools.ensurce_table_exist(lldb_attach_config.source_maps),
		initCommands = tbl_tools.ensurce_table_exist(lldb_attach_config.init_commands),
		program = program,
		args = tbl_tools.ensurce_table_exist(lldb_attach_config.args),
		waitFor = lldb_attach_config.wait_for,
		attachCommands = lldb_attach_config.attach_commands,
		pid = lldb_attach_config.pid,
	}
end

return M
