local M = {}

---Import module but not cause crash.
---@param module string
---@return any
function M.safe_require(module)
	local corr, result = pcall(require, module)
	if corr then
		return result
	else
		vim.notify('Failed to load "' .. module .. '"\nCause: ' .. result, vim.log.levels.WARN,
			{ title = "Require failed!" })
		return nil
	end
end

---Import modules but not cause crash
---@param modules string|table
---@return any
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

---Import modules with prefix  but not cause crash
---@param prefix string
---@param modules string|table
---@return any
function M.safe_requires_with_prefix(prefix, modules)
	if type(modules) == "string" then
		return M.safe_require(prefix .. '.' .. modules)
	end

	local result = {}
	for name, modpath in pairs(modules) do
		result[name] = M.safe_require(prefix .. '.' .. modpath)
	end
	return result
end

local load_abs_cache = {}
local load_abs_iso_cache = {}

--- Load lua file with absolute path
--- @param abspath string
--- @param reload boolean
--- @return any
function M.require_absolute(abspath, reload)
	if reload ~= true and load_abs_cache[abspath] then
		return load_abs_cache[abspath]
	end

	local chunk, err = loadfile(abspath)
	if not chunk then
		error(string.format("Failed to load lua file: '%s' : %s", abspath, err))
	end

	local ok, result = pcall(chunk)
	if not ok then
		error(string.format("Failed to executing lua file: '%s' : %s", abspath, result))
	end

	load_abs_cache[abspath] = result
	return result
end

--- Load lua file with absolute path in a isolation env.
--- Use this api can avoid lua code pollute nvim env.
--- @param abspath string
--- @param reload boolean
--- @return any
function M.require_absolute_isolation(abspath, reload)
	if reload ~= true and load_abs_iso_cache[abspath] then
		return load_abs_iso_cache[abspath]
	end

	local chunk, err = loadfile(abspath)
	if not chunk then
		error(string.format("Failed to load lua file: '%s' : %s", abspath, err))
	end

	local isolated_env = setmetatable({}, {__index = _G})

	setfenv(chunk, isolated_env)

	local ok, result = pcall(chunk)
	if not ok then 
		error(string.format("Failed to executing lua file: '%s' : %s", abspath, result))
	end

	load_abs_cache[abspath] = result
end

return M
