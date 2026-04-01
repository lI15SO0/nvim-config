local snip = require("plugins.completion.snip")
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
	{ src = gh("lI15SO0/lI15SO0_Snippets") },
	{ src = gh("lI15SO0/friendly-snippets") },
	{ src = gh("L3MON4D3/LuaSnip"), },
	{
		src = gh("saghen/blink.cmp"),
		version = vim.version.range('1.*')
	},
})

vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
	group = vim.api.nvim_create_augroup("LoadBlink", { clear = true }),
	once = true,
	callback = function()
		-- blonk setup
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
						snip.luasnip.activate_node({ select = true })
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
})
