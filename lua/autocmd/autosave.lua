return function()
	vim.cmd("silent! w")
	print("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
end
