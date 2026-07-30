local M = {}

--- @param options dap.Adapter
function M.registry(name, options)
	local dap = require("dap")
	dap.adapters[name] = options
end

return M
