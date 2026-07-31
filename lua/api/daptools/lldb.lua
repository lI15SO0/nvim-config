local tbl_tools = require('api.tbl')

local M = {}

--- @class lldb_config
--- @field config_cmds string[]?
--- @field build_cmds string[]?
--- @field source_maps table?
--- @field init_commands string[]?
--- @field args string[]?

--- build python config with less args.
--- @param config_name string
--- @param lldb_config lldb_config
--- @param program string|function
--- @param cwd string?
--- @return dap.Configuration
function M.make_config(config_name, lldb_config, program, cwd)
	-- ensure param exist.
	if not lldb_config then
		lldb_config = {
			config_cmds = {},
			build_cmds = {},
			source_maps = {},
			init_commands = {},
		}
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
			local config_cmds = tbl_tools.ensurce_table_exist(lldb_config.config_cmds)
			local build_cmds = tbl_tools.ensurce_table_exist(lldb_config.build_cmds)

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
		sourceMap = tbl_tools.ensurce_table_exist(lldb_config.source_maps),
		initCommands = tbl_tools.ensurce_table_exist(lldb_config.init_commands),
		program = program,
		args = tbl_tools.ensurce_table_exist(lldb_config.args),
	}
end

return M
