return function()
	if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
		vim.fn.setpos(".", vim.fn.getpos("'\""))

		vim.cmd("silent! foldopen")
	end
end
