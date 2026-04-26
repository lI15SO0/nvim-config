local M = {}

--- select a valid cmd from cmds.
--- @param cmds table<string>
--- @return table|nil 
function M.cmd_select(cmds)
	for _, v in ipairs(cmds) do
		if #v ~= 0 then
			if vim.fn.executable(v[1]) == 1 then
				return v
			end
		end
	end
	return nil
end

return M
