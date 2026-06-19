local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("nvim-treesitter/nvim-treesitter") },
	{ src = gh("HiPhish/rainbow-delimiters.nvim") },
	{ src = gh("nvim-treesitter/nvim-treesitter-textobjects") },
})

local path = "plugins.treesitter"
local plugins = {
	"treesitter",
	"nvim-treesitter-textobjects",
}

api.loader.safe_requires_with_prefix(path, plugins)
