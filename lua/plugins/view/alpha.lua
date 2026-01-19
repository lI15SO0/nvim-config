return {
	{
		"goolord/alpha-nvim",
		config = function()
			-- require 'alpha'.setup(require 'alpha.themes.dashboard'.config)

			local options = require("core.options")
			local alpha = require('alpha')
			local dashboard = require('alpha.themes.dashboard')

			dashboard.section.header.val = options.ui.header
			dashboard.section.buttons.val = {
				dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("<Leader>ff", "  Find file", ":lua require ('telescope.builtin').find_files() <CR>"),
				dashboard.button("<Leader>fg", "  Grep file", ":lua require ('telescope.builtin').live_grep() <CR>"),
				dashboard.button("q", "⏻  Quit NVIM", ":qa<CR>"),
			}

			-- dashboard.section.footer.val =
			dashboard.config.opts.noautocmd = true

			alpha.setup(dashboard.config)
		end
	}
}
