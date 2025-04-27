local path = {}

function path.join(...)
	return table.concat(vim.iter({ ... }):flatten():totable(), '/')
end

function path.exists(p)
	return vim.fn.filereadable(p) == 1
end

return path
