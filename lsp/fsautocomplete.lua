local root_file_extension = { '%.sln$', '%.slnx$', '%.fsproj$', '%.git$' }

return {
	cmd = function(dispatchers, config)
		return vim.lsp.rpc.start({ 'fsautocomplete', '--adaptive-lsp-server-enabled' }, dispatchers, {
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
