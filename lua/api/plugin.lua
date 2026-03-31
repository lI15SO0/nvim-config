---@class plugin
---@field gh fun(plugin_name: string): string
---@field cb fun(plugin_name: string): string
---@field gh_ssh fun(plugin_name: string): string
---@field gh_https fun(plugin_name: string): string
---@field cb_ssh fun(plugin_name: string): string
---@field cb_https fun(plugin_name: string): string
local plugin = {}

local options = {}
options.git = require("core.options.git")

--- @param plugin_name string
--- @return string
plugin.gh_ssh = function(plugin_name)
	return "git@github.com:" .. plugin_name
end

--- @param plugin_name string
--- @return string
plugin.gh_https = function(plugin_name)
	return "https://github.com/" .. plugin_name
end

--- @param plugin_name string
--- @return string
plugin.cb_ssh = function(plugin_name)
	return "git@codeberg.org:" .. plugin_name
end

--- @param plugin_name string
--- @return string
plugin.cb_https = function(plugin_name)
	return "https://codeberg.org/" .. plugin_name
end

--- Return plugin url with git
--- @param plugin_name string
--- @return string
plugin.gh = function(plugin_name)
	local url;
	if options.git.type == 'ssh' then
		url = plugin.gh_ssh(plugin_name)
	else
		url = plugin.gh_https(plugin_name)
	end
	return url
end

--- Return plugin url with git
--- @param plugin_name string
--- @return string
plugin.cb = function(plugin_name)
	local url
	if options.git.type == 'ssh' then
		url = plugin.cb_ssh(plugin_name)
	else
		url = plugin.cb_https(plugin_name)
	end
	return url
end


local plugin_setuped = {}

-- Set keymap and setup plugin.
---@param plugin_name string
---@param keymaps table<integer, {mod: string|string[], lhs: string, rhs: string|function, opts?: vim.keymap.set.Opts}>
---@param setup table | fun()
plugin.keys_setup = function(plugin_name, keymaps, setup)
	for _, keymap in pairs(keymaps) do
		vim.keymap.set(keymap.mod, keymap.lhs,
			function()
				if plugin_setuped[plugin_name] ~= true then
					if type(setup) == "table" then
						require(plugin_name).setup(setup)
					else
						setup()
					end
					plugin_setuped[plugin_name] = true
				end
				keymap.rhs()
			end
			, keymap.opts)
	end
end

return plugin
