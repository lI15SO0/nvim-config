local path = {}

function path.join(...)
	return table.concat(vim.tbl_flatten({ ... }), '/')
end

function path.exists(p)
	return vim.fn.filereadable(p) == 1
end

return path
