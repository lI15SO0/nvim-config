return function()
	local path = vim.fn.expand("%")
	local dir = vim.fn.fnamemodify(path, ":p:h")

	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
	else
		vim.notify("Directory already exists", "WARN", { title = "Nvim" })
	end
end
