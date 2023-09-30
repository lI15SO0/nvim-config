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
		"27justin/virtuality.nvim",
		 event = "LspAttach",
	},
	{
		"jinzhongjia/LspUI.nvim",
		event = { "LspAttach" },
		branch = 'legacy',
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
