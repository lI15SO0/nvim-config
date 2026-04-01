local M = {}

local api = require('api')

function M.reg_lsp_commands()
	vim.api.nvim_create_user_command("LspRestart", api.lsp.restart_lsp, {})
end

return M
