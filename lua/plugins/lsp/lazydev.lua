local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("folke/lazydev.nvim") },
})

