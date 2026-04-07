local expand_extensions = { 'python', 'yaml', 'fsharp', "haskell"}

local function f()
	vim.bo.expandtab = true
	vim.bo.softtabstop = 4
	vim.bo.shiftwidth = 4
end

--- @type event_obj
return {
	event = { "FileType" },
	opts = {
		pattern = expand_extensions,
		group = "bufset",
		callback = f,
		desc = "Auto set tab behavior in diff buf.",
		nested = true,
	}
}
