-- https://astral.org.cn/ruff
-- uv add --dev ruff

---@type vim.lsp.Config
return {
	cmd = { 'ruff', 'server' },
	filetypes = { 'python' },
	root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
	init_options = {
		settings = {
			lint = { enable = false },
			format = { enable = true },
		},
	},
}
