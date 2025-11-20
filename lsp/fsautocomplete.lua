local root_file_extension = { '%.sln$', '%.slnx$', '%.fsproj$', '%.git$' }

return {
	cmd = function(dispatchers, config)
		return vim.lsp.rpc.start({ 'fsautocomplete', '--adaptive-lsp-server-enabled' }, dispatchers, {
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
	filetypes = { 'fsharp', 'fs' },

	-- https://github.com/ionide/FsAutoComplete?tab=readme-ov-file#settings
	init_options = {
		AutomaticWorkspaceInit = true,
	},
	settings = {
		FSharp = {
			keywordsAutocomplete = true,
			ExternalAutocomplete = false,
			Linter = true,
			UnionCaseStubGeneration = true,
			UnionCaseStubGenerationBody = 'failwith "Not Implemented"',
			RecordStubGeneration = true,
			RecordStubGenerationBody = 'failwith "Not Implemented"',
			InterfaceStubGeneration = true,
			InterfaceStubGenerationObjectIdentifier = 'this',
			InterfaceStubGenerationMethodBody = 'failwith "Not Implemented"',
			UnusedOpensAnalyzer = true,
			UnusedDeclarationsAnalyzer = true,
			UseSdkScripts = true,
			SimplifyNameAnalyzer = true,
			ResolveNamespaces = true,
			EnableReferenceCodeLens = true,
		},
	},
}
