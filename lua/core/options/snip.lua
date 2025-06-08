local M = {}

M = {}
M.paths = {}
M.loader = {
	loader = nil,
	has_init = false,
}

function M.loader.init_loader(loader)
	M.loader.loader = loader
	M.loader.has_init = true
end

function M.loader.load()
	if M.loader.has_init then
		M.loader.loader(M.paths)
	else
		vim.notify("Loader has not initialized. please init the loader first")
	end
end

return M
