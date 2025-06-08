local map = {}

---Set one key bind
---@param key table
function map.register(key)
	key.options.desc = key.description

	if not key.options.force then
		vim.keymap.set(key.mode, key.key, key.fn, key.options)
	else
		key.options.force = nil
		if type(key.mode) == 'string' then
			vim.api.nvim_set_keymap(key.mode, key.key, key.fn, key.options)
		else
			for _, mode in ipairs(key.mode)  do
				vim.api.nvim_set_keymap(mode, key.key, key.fn, key.options)
			end
		end
	end
end

---Unset one key bind
---@param key table
function map.unregister(key)
	vim.keymap.del(key.mode, key.key, key.opttions)
end

---Set key binds with table.
---@param maps table
function map.bulk_regist(maps)
	for _,key in pairs(maps) do
		map.register(key)
	end
end

---Unset key binds with table.
---@param maps table
function map.bulk_unregist(maps)
	for _,key in pairs(maps) do
		map.unregister(key)
	end
end

return map
