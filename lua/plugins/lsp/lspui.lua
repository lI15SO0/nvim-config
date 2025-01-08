return {
	{
		"j-hui/fidget.nvim",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {}
	},
	{
		"jinzhongjia/LspUI.nvim",
		event = { "LspAttach" },
		opts = {
			prompt = false,
			lightbulb = {
				enable = true,
			},
			peek_definition = {
				enable = true,
			}
		},
	}
}
