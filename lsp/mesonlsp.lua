--- https://github.com/JCWasmx86/mesonlsp

local function _search_meson_root(path)
	if type(path) ~= 'string' or path == '' then
		return nil
	end

	local pattern = 'meson.build'
	local file = vim.fn.glob(table.concat({ path, pattern }, '/'))

	local dirname = vim.fs.dirname(path)
	if dirname == path then return nil end

	if file == '' then
		return _search_meson_root(dirname)
	end

	for line in io.lines(file) do
		if not line:match '^%s*#.*' then
			local str = line:gsub('%s+', '')
			if str ~= '' then
				if str:match '^project%(' then
					return path
				else
					break
				end
			end
		end
	end

	return _search_meson_root(dirname)
end

local search_meson_root = function(bufnr)
	local path = vim.api.nvim_buf_get_name(bufnr)
	return _search_meson_root(vim.fs.dirname(vim.fs.abspath(path)))
end

---@type vim.lsp.Config
return {
	cmd = { 'mesonlsp', '--lsp' },
	filetypes = { 'meson' },
	root_dir = function(bufnr, on_dir)
		on_dir(search_meson_root(bufnr) or vim.fs.root(bufnr, '.git'))
	end,
}
