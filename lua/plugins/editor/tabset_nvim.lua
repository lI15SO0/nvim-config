return {
	{
		"FotiadisM/tabset.nvim",
		config = function()
			require("tabset").setup {
				defaults = {
					tabwidth = 4,
					expandtab = false
				},
				languages = {
					{
						filetypes = { "haskell", "fsharp" },
						config = {
							tabwidth = 4,
							expandtab = true
						}
					}
				}
			}
		end
	}
}
