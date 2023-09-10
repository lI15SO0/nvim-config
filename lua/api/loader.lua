local M = {}

function M.safe_require(module)
	local corr, result = pcall(require, module)
	if corr then
		return result
	else
		vim.notify('Failed to load "' .. module .. '"\nCause: ' .. result, vim.log.levels.WARN, {title= "Require failed!"})
		return nil
	end
end

function M.safe_requires(modules)

	if type(modules) == "string" then
		return M.safe_require(modules)
	end

	local result = {}
	for name, modpath in pairs(modules) do
		result[name] = M.safe_require(modpath)
	end
	return result
end

return M
