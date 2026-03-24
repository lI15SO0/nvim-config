local M = {}

-- Lsp client functions.

M.restart_lsp = function()
	local lsps = vim.lsp.get_clients()
	for _, j in pairs(lsps) do
		vim.lsp.stop_client(j.id, true)
		vim.lsp.start(j.config)
	end
end

-- Diagnostic functions

local function diagnostic_jump(diagnostic, emsg)
	if diagnostic == nil then
		vim.notify(emsg, vim.log.levels.INFO, { title = "Diagnostic Jumper" })
	else
		vim.diagnostic.jump { diagnostic = diagnostic }
	end
end

M.toggle_diagnostic = function()
	local diag_status = true
	return function()
		if diag_status == true then
			vim.diagnostic.config { underline = true, virtual_text = false, signs = true, update_in_insert = true }
		else
			vim.diagnostic.config { underline = true, virtual_text = true, signs = true, update_in_insert = true }
		end
		diag_status = not diag_status
	end
end

M.next_diagnostic = function()
	local next_diagnostic = vim.diagnostic.get_next()
	diagnostic_jump(next_diagnostic, "Can not found next diagnostic.")
end

M.prev_diagnostic = function()
	local prev_diagnostic = vim.diagnostic.get_prev()
	diagnostic_jump(prev_diagnostic, "Can not found previous diagnostic.")
end

return M
