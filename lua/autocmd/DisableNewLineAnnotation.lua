local function f()
	vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
end

return {
	events = "BufEnter",
	func = f,
	opts = { desc = "Disable new line auto generate annotation head." }
}
