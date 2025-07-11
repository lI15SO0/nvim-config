local pluginLoader = {}

---Build plugin flatten for lazy loader.
---@param prefix string
---@param plugtbl table
---@return table
function pluginLoader.construct(prefix, plugtbl)
	local plugins_table = {}
	for _, v in pairs(plugtbl) do
		local status, response = pcall(require, prefix .. "." .. v)
		if status then
			table.insert(plugins_table, response)
		else
			vim.notify("[Warn]: " .. prefix .. "." .. v .. " load failed!\nCause:\n" .. response, vim.log.levels.WARN,
				{ title = "Plugin Loader" })
		end
	end
	return plugins_table
end

return pluginLoader
