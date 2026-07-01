-- https://deno.com/
-- https://deno.org.cn/


---@type vim.lsp.Config
return {
	cmd = { 'deno', 'lsp' },
	cmd_env = { NO_COLOR = true },
	filetypes = {
		'javascript',
		'javascriptreact',
		'typescript',
		'typescriptreact',
	},
	root_dir = function(bufnr, on_dir)
		local root_markers = { { 'deno.json', 'deno.jsonc' }, { 'deno.lock' }, {}, '.git' }

		local deno_root = vim.fs.root(bufnr, root_markers[1])
		local deno_lock_root = vim.fs.root(bufnr, root_markers[2])
		local project_root = vim.fs.root(bufnr, root_markers)

		if
			(deno_lock_root and (not project_root or #deno_lock_root > #project_root))
			or (deno_root and (not project_root or #deno_root >= #project_root))
		then
			on_dir(project_root or deno_lock_root or deno_root)
		end
	end,
}
