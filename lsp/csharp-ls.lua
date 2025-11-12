local api = require("api")

local root_file_extension = { '%.sln$', '%.slnx$', '%.csproj$', '%.git$' }

return {
	cmd = function(dispatchers, config)
		return vim.lsp.rpc.start({ 'csharp-ls' }, dispatchers, {
			-- csharp-ls attempt to locate sln, slnx or csproj files from cwd, so set cwd to root directory.
			-- If cmd_cwd is provided, use it instead.
			cwd = config.cmd_cwd or config.root_dir,
			env = config.cmd_env,
			detached = config.detached,
		})
	end,
	root_dir = vim.fs.root(0, function(name, _)
		for _, extension in pairs(root_file_extension) do
			if name:match(extension) then
				return true
			end
		end
		return false;
	end),
	filetypes = { 'cs' },
	init_options = {
		AutomaticWorkspaceInit = true,
	},
}
