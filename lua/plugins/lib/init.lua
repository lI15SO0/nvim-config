local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("nvim-neotest/nvim-nio") },
	{ src = gh("nvim-lua/plenary.nvim") },
	{ src = gh("lumen-oss/lz.n") },
})
