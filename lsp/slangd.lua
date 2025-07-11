local bin_name = 'slangd'

if vim.fn.has 'win32' == 1 then
	bin_name = 'slangd.exe'
end

return {
	cmd = { bin_name },
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
