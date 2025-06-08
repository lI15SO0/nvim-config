local M = {}

---Add snippets path into options.snip
---@param path string|table
function M.add_snip_dir(path)
	local options = require("core.options")
	if type(path) == "string" then
		table.insert(options.snip.paths, path)
	elseif type(path) == "table" then
		for _, p in pairs(path) do
			table.insert(options.snip.paths, p)
		end
	end
end

---Add snippets path into options.snip and cann load function immediately
---@param path string|table
function M.load_snip_dir(path)
	local options = require("core.options")
	if type(path) == "string" then
		table.insert(options.snip.paths, path)
	elseif type(path) == "table" then
		for _, p in pairs(path) do
			table.insert(options.snip.paths, p)
		end
	end

	-- Call load function immediately
	options.snip.loader.load()
end

---Load snippets via options.snip.loader
function M.load()
	local options = require("core.options")
	options.snip.loader.load()
end


---Init loader by custom function
---@param loader function(table)
function M.init_loader(loader)
	local options = require("core.options")
	options.snip.loader.init_loader(loader)
end

return M
