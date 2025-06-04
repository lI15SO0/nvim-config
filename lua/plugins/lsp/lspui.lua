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
			lightbulb = { enable = true, },
			peek_definition = { enable = true, },
			inlay_hint = { enable = false, },
			diagnostic = { enable = false, },
			hover = { enable = false, },
			definition = { enable = false, },
			type_definition = { enable = false, },
			declaration = { enable = false, },
			implementation = { enable = false, },
			reference = { enable = false, },
			pos_keybind = {},
			call_hierarchy = { enable = false, },
			signature = { enable = false, },
		},
	},
	{
		"ray-x/lsp_signature.nvim",
		opts = {
			floating_window = false
		},
		event = { "LspAttach" },
	}
}
