local api = require("api")
local gh = api.plugin.gh
local theme = require("plugins.view.colorscheme.sakura")
if theme.dependenices == nil then
	theme.dependenices = {}
end

vim.pack.add({
	{ src = gh(theme.colorscheme) },
	{ src = gh("nvim-lualine/lualine.nvim") },
	{ src = gh("utilyre/barbecue.nvim") },
	{ src = gh("SmiteshP/nvim-navic") },
})

vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("LoadThemeGroup", { clear = true }),
	once = true,
	callback = function()
		theme.config()

		require("lualine").setup {}
		require("barbecue").setup {
			exclude_filetypes = { "toggleterm" }
		}
	end,
})
