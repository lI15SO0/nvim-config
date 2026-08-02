--- @type dap.Adapter
return {
	type = 'executable',
	command = vim.fn.exepath('debugpy-adapter'),
}
