---@type vim.lsp.Config
return {
	cmd = { "slangd" },
	filetypes = { 'hlsl', 'shaderslang' },
	root_markers = { '.git' },
	settings = {
		slang = {
			inlayHints = {
				deducedTypes = true,
				parameterNames = true,
			}
		}
	}
}
