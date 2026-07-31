local M = {}

--- build python config with less args.
--- @param config_name string
--- @param python_path string|function
--- @param program (string|function)?
--- @return dap.Configuration
function M.make_config(config_name, python_path, program)
	if not program then
		program = "${file}"
	end

	return {
		type = 'debugpy',
		request = 'launch',
		name = config_name,
		program = program,
		pythonPath = python_path
	}
end

return M
