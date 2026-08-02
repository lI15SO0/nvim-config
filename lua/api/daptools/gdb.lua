local tbl_tools = require('api.tbl')

local M = {}

--- @class gdb_config
--- @field config_cmds string[]?
--- @field build_cmds string[]?
--- @field args string[]?

--- build python config with less args.
--- @param config_name string
--- @param gdb_config gdb_config
--- @param program string|function
--- @param cwd string?
--- @return dap.Configuration
function M.make_config(config_name, gdb_config, program, cwd)
	-- ensure param exist.
	if not gdb_config then
		gdb_config = {
			config_cmds = {},
			build_cmds = {},
			args = {},
			stop_at_beginning_of_main_subprogram = false,
		}
	end

	if gdb_config.stop_at_beginning_of_main_subprogram == nil then
		gdb_config.stop_at_beginning_of_main_subprogram = false;
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
	if type(program) == 'string' then
		local program_name = program
		program = function()
			-- Get all cmds we need.
			local config_cmds = tbl_tools.ensurce_table_exist(gdb_config.config_cmds)
			local build_cmds = tbl_tools.ensurce_table_exist(gdb_config.build_cmds)

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
		type = 'gdb',
		request = 'launch',
		name = config_name,
		cwd = cwd,
		program = program,
		args = tbl_tools.ensurce_table_exist(gdb_config.args),
		stopAtBeginningOfMainSubprogram = tbl_tools.stop_at_beginning_of_main_subprogram,
	}
end

return M
