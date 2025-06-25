--[[
Command: MakeDirectory
Description: Build previous dir for the file that editing.
]]

local function f()
	local path = vim.fn.expand("%")
	local dir = vim.fn.fnamemodify(path, ":p:h")

	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
	else
		vim.notify("Directory already exists", vim.log.levels.WARN, { title = "Nvim" })
	end
end

return {
	cmd = "MakeDirectory",
	func = f,
	desc = "Create directory if it doesn't exist"
}
