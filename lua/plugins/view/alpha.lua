local options = require("core.options")
local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("goolord/alpha-nvim") },
})

		local alpha = require('alpha')
		local dashboard = require('alpha.themes.dashboard')

		dashboard.section.header.val = options.ui.header
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("<Leader>ff", "  Find file", ":lua require ('telescope.builtin').find_files() <CR>"),
			dashboard.button("<Leader>fg", "  Grep file", ":lua require ('telescope.builtin').live_grep() <CR>"),
			dashboard.button("q", "⏻  Quit NVIM", ":qa<CR>"),
		}

		dashboard.config.opts.noautocmd = true

		alpha.setup(dashboard.config)
