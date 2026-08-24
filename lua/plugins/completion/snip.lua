local options = require("core.options")
local api = require("api")

options.snip.loader.init_loader(function(paths)
	require("luasnip.loaders.from_snipmate").lazy_load({ paths = paths })
	require("luasnip.loaders.from_lua").lazy_load({ paths = paths })
	require("luasnip.loaders.from_vscode").lazy_load({ paths = paths })
end)

local M = {}

function M.snipInit()
	require("luasnip.loaders.from_lua").lazy_load()
	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_snipmate").lazy_load()

	local snippets = api.fs.get_lua_name(vim.fn.stdpath("config") .. "/lua/snippets")
	for _, filetype in pairs(snippets) do
		local snip = api.loader.safe_requires_with_prefix("snippets", filetype)
		require("luasnip").add_snippets(filetype, snip)
	end

	options.snip.loader.load()
	M.luasnip = require("luasnip")
end

function M.getSnipEngine(args)
	require 'luasnip'.lsp_expand(args.body)
end

function M.getSnipSource()
	return "luasnip"
end

function M.reg_snip_edit_cmd()
	vim.api.nvim_create_user_command(
		"EditSnip",
		require("luasnip.loaders").edit_snippet_files,
		{ desc = "Edit Snip file" }
	)
end

function M.jumpable()
	return M.luasnip.expand_or_locally_jumpable()
end

function M.luasnip_unlink()
	M.luasnip.active_update_dependents()
	M.luasnip.unlink_current()
end

function M.Next()
	M.luasnip.expand_or_jump()
end

return M
