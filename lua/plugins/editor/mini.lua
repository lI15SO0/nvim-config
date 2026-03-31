local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("echasnovski/mini.nvim") }
})

require('mini.splitjoin').setup()
require('mini.comment').setup()
require('mini.ai').setup()
require('mini.icons').setup()
require('mini.icons').mock_nvim_web_devicons()

-- require("mini.pairs").setup()
