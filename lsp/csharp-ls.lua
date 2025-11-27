local api = require("api")

local root_file_extension = { '%.sln$', '%.slnx$', '%.csproj$', '%.git$' }

---@type vim.lsp.Config
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
	root_dir = function(bufnr, on_dir)
		for _, extension in pairs(root_file_extension) do
			local root_path = vim.fs.root(bufnr, function(name, _)
				if name:match(extension) then
					return true
				end
				return false;
			end)

			if root_path ~= nil then
				return on_dir(root_path)
			end
		end
	end,
	filetypes = { 'cs' },
	init_options = {
		AutomaticWorkspaceInit = true,
	},
}
