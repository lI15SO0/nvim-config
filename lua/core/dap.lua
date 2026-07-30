local api = require('api')

local nvim_config_path = vim.fn.stdpath('config') .. '/dap/'
local daps = api.fs.get_lua_name(nvim_config_path)

if daps ~= nil then
	for _, name in pairs(daps) do
		local dap_profile = api.loader.require_absolute( nvim_config_path .. name .. '.lua')
		api.dap.registry(name, dap_profile)
	end
end

