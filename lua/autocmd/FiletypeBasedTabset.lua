-- filetype event
local function f()

end

--- @type event_obj
return {
	events = "FileType",
	func = f,
	opts = { nested = true, desc = "Auto change FileType when filetype changed." }
}
