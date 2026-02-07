-- https://github.com/neocmakelsp/neocmakelsp
-- cargo install neocmakelsp

---@type vim.lsp.Config
return {
  cmd = { 'neocmakelsp', 'stdio' },
  filetypes = { 'cmake' },
  root_markers = { '.git', 'build', 'cmake', 'CmakeLists.txt'},
}
