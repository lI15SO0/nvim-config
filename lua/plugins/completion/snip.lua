local options = require("core.options")

options.snip.loader.init_loader(function(paths)
	require("luasnip.loaders.from_snipmate").lazy_load({ paths = paths })
	require("luasnip.loaders.from_lua").lazy_load({ paths = paths })
	require("luasnip.loaders.from_vscode").lazy_load({ paths = paths })
end)

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

	options.snip.loader.load()

	M.luasnip = require("luasnip")

	-- Solvtion from https://github.com/L3MON4D3/LuaSnip/issues/258#issuecomment-1429989436
	vim.api.nvim_create_autocmd('ModeChanged', {
		pattern = '*',
		callback = function()
			if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
				and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
				and not require('luasnip').session.jump_active
			then
				require('luasnip').unlink_current()
			end
		end
	})
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
