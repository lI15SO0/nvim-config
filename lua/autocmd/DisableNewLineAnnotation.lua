local function f()
	vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
end

return {
	event = "BufEnter",
	opts = {
		group = 'bufenter',
		callback = f,
		desc = "Disable new line auto generate annotation head."
	}
}
