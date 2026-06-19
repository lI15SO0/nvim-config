local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("echasnovski/mini.nvim") }
})

api.loader.safe_requires_with_prefix("plugins.editor.mini", {
	"ai",
	"comment",
	"icons",
	"splitjoin",
})
