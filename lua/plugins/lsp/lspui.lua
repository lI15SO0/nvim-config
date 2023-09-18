return {
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("fidget").setup{
				window = {
					blend = 0,
				},
			}
		end
	},
	{
		"27justin/virtuality.nvim",
		event = "LspAttach"
	}
}
