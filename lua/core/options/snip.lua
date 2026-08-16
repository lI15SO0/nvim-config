local M = {}

M = {}
M.paths = {}
M.loader = {}

---Init loader by custom function
---@param loader function(table)
function M.loader.init_loader(loader)
	M.loader.loader = loader
end

function M.loader.load()
	if M.loader.loader ~= nil then
		M.loader.loader(M.paths)
	else
		vim.notify("Loader has not initialized. please init the loader first")
	end
end

return M
