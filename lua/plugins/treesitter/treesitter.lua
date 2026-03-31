local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("nvim-treesitter/nvim-treesitter") },
	{ src = gh("HiPhish/rainbow-delimiters.nvim") },
	{ src = gh("nvim-treesitter/nvim-treesitter-textobjects") },
})

require('nvim-treesitter').setup {
	install_dir = vim.fn.stdpath('data') .. '/treesite',
}
