local M = {}

local funcs = require('core.lsp.functions')

function M.reg_lsp_commands()
	vim.api.nvim_create_user_command("LspRestart", funcs.restart_lsp, {})
end

return M
