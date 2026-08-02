--- @type dap.Adapter
return {
	type = 'executable',
	command = vim.fn.exepath('lldb-dap'),
}
