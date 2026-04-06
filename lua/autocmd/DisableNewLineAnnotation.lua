local function f()
	vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
end

--- @type event_obj
return {
	event = "BufEnter",
	opts = {
		group = 'bufenter',
		callback = f,
		desc = "Disable new line auto generate annotation head."
	}
}
