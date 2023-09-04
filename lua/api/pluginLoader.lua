local pluginLoader = {}

function pluginLoader.construct(prefix, plugtbl)
	local plugins_table = {}
	for i, v in pairs(plugtbl) do
		local status, response = pcall(require, prefix.."."..v)
		if status then
			table.insert(plugins_table, response)
		else
			vim.notify("[Warn]: ".. prefix .. "." .. v .. " load failed!", "Warn", {title="Plugin Loader"})
		end

	end
	return plugins_table
end

return pluginLoader
