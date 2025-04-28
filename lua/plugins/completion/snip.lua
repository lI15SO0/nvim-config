local options = require("core.options")

local snip_repos = {
	"lI15SO0/lI15SO0_Snippets",
	"rafamadriz/friendly-snippets",
}

local M = {}
function M.GetSnipPackages()
	return {
		"L3MON4D3/LuaSnip",
		dependencies = snip_repos,
		event = "VeryLazy"
	}
end

function M.snipInit()
	require("luasnip.loaders.from_snipmate").lazy_load()
	require("luasnip.loaders.from_lua").lazy_load()
	require("luasnip.loaders.from_vscode").lazy_load()

	require("luasnip.loaders.from_snipmate").lazy_load({ paths = options.snip.paths })
	require("luasnip.loaders.from_lua").lazy_load({ paths = options.snip.paths })
	require("luasnip.loaders.from_vscode").lazy_load({ paths = options.snip.paths })
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

return M
