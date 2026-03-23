return {
	{
		"j-hui/fidget.nvim",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {}
	},
	{
		"ray-x/lsp_signature.nvim",
		opts = {
			floating_window = false
		},
		event = { "LspAttach" },
	}
}
