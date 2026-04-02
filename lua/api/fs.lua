local fs = {}

function fs.get_lua_name(dir)
	local pattern = dir .. "/*.lua"
	local files = vim.fn.glob(pattern, false, true)
	local lst = {}
	for _, file in ipairs(files) do
		local name = vim.fn.fnamemodify(file, ":t:r")
		table.insert(lst, name)
	end
	return lst
end

return fs
