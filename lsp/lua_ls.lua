-- https://github.com/LuaLS/lua-language-server
-- scoop install lua-language-server # for windows
-- # package manager for linux
-- brew install lua-language-server # for macos

---@type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
  },
}
