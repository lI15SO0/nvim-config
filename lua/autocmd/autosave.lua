local banned_filetypes = {
	'oil'
}

local function f()
	local ft = vim.api.nvim_buf_get_option(0, "filetype")
	if ft ~= nil and not vim.tbl_contains(banned_filetypes, ft) then
		vim.cmd("silent! w")
	end
end

return {
	event = { "InsertLeave", "TextChanged" },
	opts = {
		group = "autosave",
		callback = f,
		desc = "Auto save file when Text changed or Leave Insert mode.",
		nested = true,
	}
}
