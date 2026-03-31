local M = {}

M.o = {
	foldenable = true,
	foldmethod = "expr",
	foldexpr = 'nvim_treesitter#foldexpr()',
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

function _G.fold_text()
	local ln = vim.fn.getline(vim.v.foldstart)
	local lns = vim.v.foldend - vim.v.foldstart
	local result = {}
	prefix_text_colorlized(result, ln, vim.v.foldstart - 1)
	table.insert(result, { '  ', nil })
	table.insert(result, { ' ', 'Normal' })
	table.insert(result, { '  ' .. lns .. ' ', 'Cursor' })
	table.insert(result, { ' ', 'Normal' })
	table.insert(result, { '  ', nil })
	return result
end

for prefix, tbl in pairs(M) do
	for key, value in pairs(tbl) do
		vim[prefix][key] = value
	end
end

return M
