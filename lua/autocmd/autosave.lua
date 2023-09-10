return function()
	vim.cmd("silent! wall")
	print("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
end
