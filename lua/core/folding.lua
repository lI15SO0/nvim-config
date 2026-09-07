local api = require('api')
local M = {}

M.o = {
	foldenable = true,
	foldmethod = "indent",
	foldlevel = 5,
	foldlevelstart = 99
}

M.opt = {
	foldtext = 'v:lua.fold_text()'
}

local function prefix_text_colorlized(result, text, row)
	local hl = nil
	for i = 1, #text do
		local char = text:sub(i, i)
		local cap_lst = vim.treesitter.get_captures_at_pos(0, row, i - 1)
		local cap = cap_lst[#cap_lst]
		if cap ~= nil then
			hl = '@' .. cap.capture
		end
		table.insert(result, { char, hl })
	end
end


local hl_group_created = false

function _G.fold_text()
	if not hl_group_created then
		local SkyBlue = '#5be3ed'
		local DeepBlue = '#14b1be'
		local White = '#FFFFFF'
		vim.api.nvim_set_hl(0, 'FoldTag_Surrounds', { fg = SkyBlue })
		vim.api.nvim_set_hl(0, 'FoldTag_SurroundsInner', { fg = SkyBlue, bg = White })
		vim.api.nvim_set_hl(0, 'FoldTag_SurroundsInnerBG', { fg = SkyBlue, bg = SkyBlue })
		vim.api.nvim_set_hl(0, 'FoldTag_Text', { fg = DeepBlue, bg = White, bold = true })
	end

	local ln = vim.fn.getline(vim.v.foldstart)
	local lns = vim.v.foldend - vim.v.foldstart
	local result = {}

	prefix_text_colorlized(result, ln, vim.v.foldstart - 1)

	table.insert(result, { '  ', nil })
	table.insert(result, { ' ', 'FoldTag_Surrounds' })
	table.insert(result, { ' ', 'FoldTag_SurroundsInnerBG' })
	table.insert(result, { '', 'FoldTag_SurroundsInner' })
	table.insert(result, { '  ' .. lns .. ' ', 'FoldTag_Text' })
	table.insert(result, { '', 'FoldTag_SurroundsInner' })
	table.insert(result, { ' ', 'FoldTag_SurroundsInnerBG' })
	table.insert(result, { ' ', 'FoldTag_Surrounds' })
	table.insert(result, { '  ', nil })
	return result
end

for prefix, tbl in pairs(M) do
	for key, value in pairs(tbl) do
		vim[prefix][key] = value
	end
end

return M
