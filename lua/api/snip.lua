local M = {}

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

return M
