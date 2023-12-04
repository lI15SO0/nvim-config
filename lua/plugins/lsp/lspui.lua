return {
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("fidget").setup {
				window = {
					blend = 0,
				},
			}
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
