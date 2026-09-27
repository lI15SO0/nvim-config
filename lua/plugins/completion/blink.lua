local snip = require("plugins.completion.snip")
local api = require("api")

local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("lI15SO0/lI15SO0_Snippets") },
	{ src = gh("lI15SO0/friendly-snippets") },
	{
		src = gh("saghen/blink.cmp"),
		version = vim.version.range('1.*')
	},
})

local blink_setup = function()
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
			['<Tab>'] = { 'accept', 'snippet_forward', 'fallback' },
			['<S-Tab>'] = { 'snippet_backward', 'fallback' },
		},
		snippets = { preset = snip.snipName },
		appearance = {
			nerd_font_variant = 'mono'
		},
		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 0 },
			keyword = { range = 'prefix' },
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
			default = {
				'lsp',
				'choice',
				'lazydev',
				'snippets',
				'path',
				'buffer'
			},
			providers = {
				lsp = {
					async = true,
				},
				choice = {
					name = 'LuaSnip Choice Nodes',
					module = 'blink-cmp-luasnip-choice',
					opts = {},
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

vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
	group = vim.api.nvim_create_augroup("LoadBlink", { clear = true }),
	once = true,
	callback = blink_setup
})
