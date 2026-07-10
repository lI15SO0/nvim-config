-- https://github.com/eclipse-jdtls/eclipse.jdt.ls

-- https://download.eclipse.org/jdtls/

local root_markers1 = {
	-- Multi-module projects
	'mvnw',
	'gradlew',
	'settings.gradle',
	'settings.gradle.kts',
	'.git',
}
local root_markers2 = {
	-- Single-module projects
	'build.xml',
	'pom.xml',
	'build.gradle',
	'build.gradle.kts',
}

--- @param workspace_path string
--- @return string
local get_cache_dir_name = function(workspace_path)
	return vim.fn.fnamemodify(workspace_path, ':p:h:t') .. '_' .. vim.fn.sha256(workspace_path)
end

---@type vim.lsp.Config
return {
	---@param dispatchers? vim.lsp.rpc.Dispatchers
	---@param config vim.lsp.ClientConfig
	cmd = function(dispatchers, config)
		local workspace_dir = vim.fn.stdpath('cache') .. '/jdtls' .. '/workspace'
		local data_dir = workspace_dir

		if config.root_dir then
			data_dir = data_dir .. '/' .. get_cache_dir_name(config.root_dir)
		end

		local config_cmd = {
			'jdtls',
			'-data',
			data_dir,
		}

		return vim.lsp.rpc.start(config_cmd, dispatchers, {
			cwd = config.cmd_cwd,
			env = config.cmd_env,
			detached = config.detached,
		})
	end,
	filetypes = { 'java' },
	root_markers = vim.list_extend(root_markers1, root_markers2),
	init_options = {},
}
