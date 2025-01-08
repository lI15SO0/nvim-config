return {
	{
		"FotiadisM/tabset.nvim",
		opts = {
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
	}
}
