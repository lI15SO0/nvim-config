-- https://github.com/LuaLS/lua-language-server
-- scoop install lua-language-server # for windows
-- # package manager for linux
-- brew install lua-language-server # for macos
local root_markers = {
	'.emmyrc.json',
	'.git',
	'.luacheckrc',
	'.luarc.json',
	'.luarc.jsonc',
	'.stylua.toml',
	'selene.toml',
	'selene.yml',
	'stylua.toml',
}


---@type vim.lsp.Config
return {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = root_markers,
	settings = {
		Lua = {
			codeLens = { enable = true },
			hint = { enable = true, semicolon = 'Disable' },
		},
	},
}
