local options = require("core.options")
local api = require("api")

local gh = api.plugin.gh

vim.api.nvim_create_autocmd('PackChanged', {
	once = true,
	callback = function(ev)
		local name = ev.data.spec.name
		local kind = ev.data.kind
		local cwd = ev.data.path

		if name == 'LuaSnip' and (kind == 'install' or kind == 'update') then
			local configure = { 'make', 'install_jsregexp', '-j' }
			vim.system(configure, { cwd = cwd }, function(obj)
				if obj.code ~= 0 then
					vim.notify('make jsregexp failed', vim.log.levels.ERROR, { title = "LuaSnip" })
					return
				end
			end)
		end
	end,
})

vim.pack.add({
	{ src = gh("L3MON4D3/LuaSnip"), },
	{ src = gh("becknik/blink-cmp-luasnip-choice") },
})


options.snip.loader.init_loader(function(paths)
	require("luasnip.loaders.from_snipmate").lazy_load({ paths = paths })
	require("luasnip.loaders.from_lua").lazy_load({ paths = paths })
	require("luasnip.loaders.from_vscode").lazy_load({ paths = paths })
end)

local M = {
	snipName = "luasnip",
	luasnip = require("luasnip")
}

function M.snipInit()
	require("luasnip.loaders.from_snipmate").lazy_load()
	require("luasnip.loaders.from_lua").lazy_load()
	require("luasnip.loaders.from_vscode").lazy_load()

	local snippets = api.fs.get_lua_name(vim.fn.stdpath("config") .. "/lua/snippets")
	for _, filetype in pairs(snippets) do
		local snip = api.loader.safe_requires_with_prefix("snippets", filetype)
		M.luasnip.add_snippets(filetype, snip)
	end

	options.snip.loader.load()
end

function M.reg_snip_edit_cmd()
	vim.api.nvim_create_user_command(
		"EditSnip",
		require("luasnip.loaders").edit_snippet_files,
		{ desc = "Edit Snip file" }
	)
end

return M
