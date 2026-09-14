-- https://github.com/yioneko/vtsls
-- npm install -g @vtsls/language-server

return {
	cmd = { 'vtsls', '--stdio' },
	init_options = {
		hostInfo = 'neovim',
	},
	filetypes = {
		'javascript',
		'javascriptreact',
		'typescript',
		'typescriptreact',
	},
	root_dir = function(bufnr, on_dir)
		local root_markers = { 'package.json', 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb',
			'bun.lock' }
		root_markers = { root_markers, { '.git' } }

		local deno_root = vim.fs.root(bufnr, { 'deno.json', 'deno.jsonc' })
		local deno_lock_root = vim.fs.root(bufnr, { 'deno.lock' })
		local project_root = vim.fs.root(bufnr, root_markers)
		if deno_lock_root and (not project_root or #deno_lock_root > #project_root) then
			return
		end

		if deno_root and (not project_root or #deno_root >= #project_root) then
			return
		end

		on_dir(project_root or vim.fn.getcwd())
	end,
}
