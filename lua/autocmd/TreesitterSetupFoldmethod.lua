local ts = require('nvim-treesitter')

local lsp_avaliable = function()
	return vim.lsp.buf_is_attached(0)
end

local treesitter_avaliable = function()
	local ts_lst = ts.get_installed()
	local ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
	if vim.list_contains(ts_lst, ft) then
		return 1
	end

	return -1
end

local set_fold_method = function()
	if lsp_avaliable() then return end

	if treesitter_avaliable() then
		vim.wo.foldmethod = 'expr'
		vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
	else
		vim.wo.foldmethod = 'indent'
		vim.wo.foldexpr = nil
	end
end

--- @type event_obj
return {
	event = { "FileType" },
	opts = {
		group = "treesitter",
		callback = set_fold_method,
		desc = "Auto setup foldmethod and foldexpr.",
		nested = true,
	}
}
