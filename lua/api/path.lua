local path = {}

---Flatten string table and then join it with '/'
---@param ... string|table
---@return string
function path.join(...)
	return table.concat(vim.iter({ ... }):flatten():totable(), '/')
end

---Test path is exists, it just vim.fn.filereadable
---@param p any
---@return boolean
function path.exists(p)
	return vim.fn.filereadable(p) == 1
end

return path
