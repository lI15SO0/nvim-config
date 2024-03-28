-- https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
local snip = require("plugins.completion.snip")

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local snippackages = snip.GetSnipPackages()

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"FelipeLema/cmp-async-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		-- "f3fora/cmp-spell",
		snippackages,
	},
	event = "VeryLazy",
	config = function()
		snip.snipInit()
		local cmp = require("cmp")

		cmp.setup {
			snippet = {
				expand = snip.getSnipEngine
			},
			sources = cmp.config.sources {
				{ name = snip.getSnipSource() },
				{ name = "buffer" },
				{ name = 'async_path' },
			},
			mapping = cmp.mapping.preset.insert {
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-e>'] = cmp.mapping.abort(),
				['<C-p>'] = cmp.mapping.abort(),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm({ select = true })
					elseif snip.jumpable() then
						snip.Next()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if not cmp.visible() then
						if snip.jumpable() then
							snip.Prev()
						end
					else
						fallback()
					end
				end, { "i", "s" }),

				["<c-j>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<c-k>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, { "i", "s" }),
			},
			experimental = {
				ghost_text = true,
			},
			sorting = {
				comparators = {
					cmp.config.compare.locality,
					cmp.config.compare.scopes,
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.kind,
					cmp.config.compare.length,
					cmp.config.compare.sort_text,
					cmp.config.compare.order,
					cmp.config.compare.recently_used,
				},
			},
			formatting = {
				format = function(entry, vim_item)
					vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
					return vim_item
				end
			},
		}

		cmp.setup.cmdline('/', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer' }
			}
		})

		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' }
			}, {
				{
					name = 'cmdline',
					option = {
						ignore_cmds = { 'Man', '!' }
					}
				}
			})
		})

		snip.reg_snip_edit_cmd()
	end
}
