local M = {}

--- Make godot debug configure.
--- @param config_name string
--- @return dap.Configuration
function M.make_config(config_name)
	return {
		type = 'godot',
		request = 'launch',
		name = config_name,
		project = '${workspaceFolder}',
	}
end

--- Make godot debug configure with mono proj.
--- @param config_name string
--- @param godot_program_uri string
--- @return dap.Configuration
function M.make_config_with_cs(config_name, godot_program_uri)
	return {
		type = 'netcoredbg',
		request = 'launch',
		name = config_name,
		cwd = '${workspaceFolder}',
		program = function ()
			vim.fn.system({'dotnet', 'build'})
			return godot_program_uri
		end,
		arg = {'--remote-debug', 'tcp://127.0.0.1:6006'},
		stopAtEntry = false,
	}
end

return M
