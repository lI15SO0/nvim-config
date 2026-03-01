local expand_extensions = { '*.py', '*.yaml', '*.fs', "*.hs" }

local function f()
	vim.bo.expandtab = true
	vim.bo.softtabstop = 4
	vim.bo.shiftwidth = 4
end

return {
	event = { 'BufNewFile', 'BufRead' },
	opts = {
		pattern = expand_extensions,
		group = "bufset",
		callback = f,
		desc = "Auto set tab behavior in diff buf.",
		nested = true,
	}
}
