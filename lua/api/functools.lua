local functools = {}

vim.inspect()

local runned = {}
---Run function only once
---@param func function
---@return boolean runned
---@return any? result
functools.run_once = function(func, ...)
	local args_string = vim.inspect(...)

	local func_runned_tbl = runned[func]
	if func_runned_tbl == nil then
		runned[func] = {}
		func_runned_tbl = runned[func]
	end

	if func_runned_tbl[args_string] ~= nil then
		return false, nil
	end

	func_runned_tbl[args_string] = true
	return true, func(...)
end


---Wrap a function only run once
---@param func function
---@return fun(...): boolean, any? wrapped_function
functools.run_once_wrap = function(func)
	return function(...)
		return functools.run_once(func, ...)
	end
end

return functools
