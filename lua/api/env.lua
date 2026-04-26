local M = {}

--- select a valid cmd from cmds.
--- @param cmds table<table<string>>
--- @return table|nil
function M.cmd_select(cmds)
	if not cmds then return nil end
	for _, v in ipairs(cmds) do
		if v and v[1] and vim.fn.executable(v[1]) == 1 then
			return v
		end
	end
	return nil
end

return M
