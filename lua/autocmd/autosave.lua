local function f()
	vim.cmd("silent! w")
end

return {
	events = { "InsertLeave", "TextChanged" },
	func = f,
	opts = { nested = true, desc = "Auto save file when Text changed or Leave Insert mode." }
}
