local options = require("core.options")

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local snip_repos = {
	"lI15SO0/lI15SO0_Snippets",
	"rafamadriz/friendly-snippets",
}

local M = {}
function M.GetSnipPackages()
	return {
		"saadparwaiz1/cmp_luasnip",
		dependencies = {
			"L3MON4D3/LuaSnip",
			dependencies = snip_repos,
			event = "VeryLazy"
		},
	}
end

function M.snipInit()
	require("luasnip.loaders.from_snipmate").lazy_load()
	require("luasnip.loaders.from_lua").lazy_load()
	require("luasnip.loaders.from_vscode").lazy_load()
	M.luasnip = require("luasnip")
end

function M.getSnipEngine(args)
	require 'luasnip'.lsp_expand(args.body)
end

function M.getSnipSource()
	return "luasnip"
end

function M.jumpable()
	if M.luasnip.expand_or_locally_jumpable() then
		return true
	end
	return false
end

function M.Next()
	M.luasnip.expand_or_jump()
end

function M.Prev()
	M.luasnip.jump(-1)
end

function M.reg_snip_edit_cmd()
	vim.api.nvim_create_user_command(
		"EditSnip",
		require("luasnip.loaders").edit_snippet_files,
		{ desc = "Edit Snip file" }
	)
end

return M
