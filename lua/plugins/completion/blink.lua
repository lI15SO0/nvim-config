local snip = require("plugins.completion.snip")

return
{
	'saghen/blink.cmp',
	dependencies = { snip.GetSnipPackages() },
	version = '1.*',
	opts_extend = { 'sources.default' },
	config = function()
		snip.snipInit()
		require('blink.cmp').setup {
			keymap = {
				preset = 'none',
				["<C-space>"] = { 'show', 'fallback' },
				['<C-k>'] = { 'select_prev', 'fallback' },
				['<C-j>'] = { 'select_next', 'fallback' },
				['<C-p>'] = { 'cancel', 'fallback' },
				['<up>'] = { 'select_prev', 'fallback' },
				['<down>'] = { 'select_next', 'fallback' },
				['<Tab>'] = { 'accept', function(cmp)
					if snip.luasnip.expand_or_locally_jumpable() then
						snip.luasnip.activate_node({select = true})
						cmp.snippet_forward()
						return true
					end
					snip.luasnip.unlink_current()
					return false
				end, 'fallback' },
				['<S-Tab>'] = { function(cmp)
					if snip.luasnip.expand_or_locally_jumpable() then
						snip.luasnip.activate_node()
						cmp.snippet_backward()
						return true
					end
					return false
				end, 'fallback' },
			},
			snippets = { preset = 'luasnip' },
			appearance = {
				nerd_font_variant = 'mono'
			},
			completion = {
				documentation = { auto_show = true, auto_show_delay_ms = 0 },
				keyword = {
					-- Possibily value: prefix , full
					range = 'prefix'
				},
				list = { selection = { preselect = true, auto_insert = false } },
				ghost_text = { enabled = true },
			},
			cmdline = {
				keymap = {
					['<Tab>'] = { 'show', 'accept' },
					['<C-k>'] = { 'select_prev', 'fallback' },
					['<C-j>'] = { 'select_next', 'fallback' },
					['<up>'] = { 'select_prev', 'fallback' },
					['<down>'] = { 'select_next', 'fallback' },
				},
				completion = {
					ghost_text = { enabled = true },
					menu = { auto_show = true },
				}
			},
			signature = { enabled = true },
			sources = {
				default = { 'snippets', 'lsp', 'path', 'buffer' },
				providers = {
					snippets = { score_offset = 1000 },
					lsp = {
						async = true,
					},
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
			fuzzy = { implementation = 'prefer_rust_with_warning' },
		}

		snip.reg_snip_edit_cmd()
	end
}
