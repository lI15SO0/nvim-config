local lsp = {}

--- Enable lsp by filetype via autocmd
--- @param file_types table<string> | string
--- @param augroup string
--- @param lsp_enable function | string
lsp.enable_with_filetype = function(file_types, augroup, lsp_enable)
	local callback = nil
	if type(lsp_enable) == 'string' then
		callback = function()
			vim.lsp.enable(lsp_enable)
		end
	else
		callback = lsp_enable
	end

	if (callback == nil) then
		vim.notify("Error in setup lsp: " .. augroup, vim.log.levels.ERROR, {title = "LspEnalbe"})
	else
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup(augroup, { clear = true }),
			once = true,
			pattern = file_types,
			callback = callback,
		})
	end
end

lsp.restart_lsp = function()
	local lsps = vim.lsp.get_clients()
	for _, j in pairs(lsps) do
		j:stop()
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

lsp.toggle_diagnostic = function()
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

lsp.next_diagnostic = function()
	local next_diagnostic = vim.diagnostic.get_next()
	diagnostic_jump(next_diagnostic, "Can not found next diagnostic.")
end

lsp.prev_diagnostic = function()
	local prev_diagnostic = vim.diagnostic.get_prev()
	diagnostic_jump(prev_diagnostic, "Can not found previous diagnostic.")
end

lsp.toggle_inlay_hint = function()
	local enable = vim.lsp.inlay_hint.is_enabled()
	vim.lsp.inlay_hint.enable(not enable)
end

return lsp
