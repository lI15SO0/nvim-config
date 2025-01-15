-- filetype event
local function f()

end

return {
	events = "FileType",
	func = f,
	opts = { nested = true, desc = "Auto change FileType when filetype changed." }
}
