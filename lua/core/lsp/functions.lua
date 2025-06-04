local M = {}
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


return M
