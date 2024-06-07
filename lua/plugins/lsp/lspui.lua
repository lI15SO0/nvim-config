return {
	{
		"j-hui/fidget.nvim",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("fidget").setup()
		end
	},
	{
		"jinzhongjia/LspUI.nvim",
		event = { "LspAttach" },
		config = function()
			local LspUI = require("LspUI")
			LspUI.setup({
				prompt = false,
				lightbulb = {
					enable = true,
				},
				peek_definition = {
					enable = true,
				}
			})
		end
	}
}
