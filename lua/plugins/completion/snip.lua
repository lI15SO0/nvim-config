local options = require("core.options")

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local M = {}
function M.GetSnipPackages()
	if options.snip.engine == "vsnip" then
		return {
			"hrsh7th/cmp-vsnip",
			dependencies = {
				"hrsh7th/vim-vsnip",
				dependencies = {
					"rafamadriz/friendly-snippets",
					event = "VeryLazy"
				},
			},
		}
	elseif options.snip.engine == "snippy" then
		return {
			"dcampos/cmp-snippy",
			dependencies = {
				"dcampos/nvim-snippy",
				dependencies = {
					"rafamadriz/friendly-snippets",
					event = "VeryLazy"
				},
			},
		}
	elseif options.snip.engine == "luasnip" then
		return {
			"saadparwaiz1/cmp_luasnip",
			dependencies = {
				"L3MON4D3/LuaSnip",
				dependencies = {
					"rafamadriz/friendly-snippets",
					event = "VeryLazy"
				},
			},
		}
	end
	return {
		"hrsh7th/cmp-vsnip",
		dependencies = {
			"hrsh7th/vim-vsnip",
			dependencies = {
				"rafamadriz/friendly-snippets",
					event = "VeryLazy"
			},
		},

	}
end

function M.snipInit()
	if options.snip.engine == "vsnip" then
		vim.g.vsnip_snippet_dir = options.snip.snippath
	elseif options.snip.engine == "snippy" then
		M.snippy = require "snippy"
	elseif options.snip.engine == "luasnip" then
		require("luasnip.loaders.from_snipmate").lazy_load({
			paths = {
				options.snip.snippath,
				vim.fn.stdpath("data") .. '/lazy/friendly-snippets',
			}
		})

		require("luasnip.loaders.from_lua").lazy_load({
			paths = {
				options.snip.snippath,
				vim.fn.stdpath("data") .. '/lazy/friendly-snippets',
			}
		})

		require("luasnip.loaders.from_vscode").lazy_load({
			paths = {
				options.snip.snippath,
				vim.fn.stdpath("data") .. '/lazy/friendly-snippets',
			}
		})
		-- require("luasnip.loaders.from_" .. options.snip.luasnip_method).lazy_load()
		M.luasnip = require("luasnip")
	else
		options.snip.engine = "vsnip"
		vim.g.vsnip_snippet_dir = options.snip.snippath
		vim.notify("Unable resove snipEngine's name, Pls check core/options.lua", vim.log.levels.WARN)
	end
end

function M.getSnipEngine(args)
	if options.snip.engine == "vsnip" then
		vim.fn['vsnip#anonymous'](args.body)
	elseif options.snip.engine == "snippy" then
		require 'snippy'.expand_snippet(args.body)
	elseif options.snip.engine == "luasnip" then
		require 'luasnip'.lsp_expand(args.body)
	end
end

function M.getSnipSource()
	if options.snip.engine == "vsnip" then
		return 'vsnip'
	elseif options.snip.engine == "snippy" then
		return 'snippy'
	elseif options.snip.engine == "luasnip" then
		return "luasnip"
	end
end

function M.jumpable()
	if options.snip.engine == "vsnip" then
		if vim.fn["vsnip#available"](1) == 1 then
			return true
		end
	elseif options.snip.engine == "snippy" then
		if M.snippy.can_expand_or_advance() then
			return true
		end
	elseif options.snip.engine == "luasnip" then
		if M.luasnip.expand_or_locally_jumpable() then
			return true
		end
	end
	return false
end

function M.Next()
	if options.snip.engine == "vsnip" then
		feedkey("<Plug>(vsnip-expand-or-jump)", "")
	elseif options.snip.engine == "snippy" then
		M.snippy.expand_or_advance()
	elseif options.snip.engine == "luasnip" then
		M.luasnip.expand_or_jump()
	end
end

function M.Prev()
	if options.snip.engine == "vsnip" then
		feedkey("<Plug>(vsnip-jump-prev)", "")
	elseif options.snip.engine == "snippy" then
		M.snippy.previous()
	elseif options.snip.engine == "luasnip" then
		M.luasnip.jump(-1)
	end
end

return M
