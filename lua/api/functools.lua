local functools = {}

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

functools.curry = function(fn)
	assert(type(fn) == "function", "fn must be a function")
	local info = debug.getinfo(fn, "u")
	local arity = info and info.nparams or 1
	if arity <= 0 then arity = 1 end

	local function step(acc, n)
		return function(...)
			local k = select('#', ...)
			local next_acc, next_n = {}, n
			for i = 1, n do next_acc[i] = acc[i] end
			for i = 1, k do
				next_n = next_n + 1
				next_acc[next_n] = (select(i, ...))
			end
			if next_n >= arity then
				return fn(unpack(next_acc, 1, arity))
			end
			return step(next_acc, next_n)
		end
	end

	return step({}, 0)
end

return functools
