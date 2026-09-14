local api = require('api')

local ef = function()
	local js_root_markers = { 'package.json', 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock' }

	local bufnr = vim.api.nvim_win_get_buf(0)

	local deno_root = vim.fs.root(bufnr, { 'deno.json', 'deno.jsonc' })
	local deno_lock_root = vim.fs.root(bufnr, { 'deno.lock' })
	local project_root = vim.fs.root(bufnr, js_root_markers)

	-- deno
	if (deno_lock_root and (not project_root or #deno_lock_root > #project_root)) or
		(deno_root and (not project_root or #deno_root >= #project_root))
	then
		vim.lsp.enable('deno')
	else
		vim.lsp.enable('vtsls')
	end
end

local enable_lsp_func = api.functools.curry(api.lsp.enable_with_filetype)({
	'javascript',
	'javascriptreact',
	'typescript',
	'typescriptreact',
})("LSP_Enable_javascript")(ef)
