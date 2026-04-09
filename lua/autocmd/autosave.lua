local banned_filetypes = {
	'oil',
	'nvim-pack'
}

local function f()
	local ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
	if ft ~= nil and not vim.tbl_contains(banned_filetypes, ft) then
		vim.cmd("silent! w")
	end
end

--- @type event_obj
return {
	event = { "InsertLeave", "TextChanged" },
	opts = {
		group = "autosave",
		callback = f,
		desc = "Auto save file when Text changed or Leave Insert mode.",
		nested = true,
	}
}
