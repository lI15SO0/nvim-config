local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("nvim-treesitter/nvim-treesitter") },
	{ src = gh("HiPhish/rainbow-delimiters.nvim") },
	{ src = gh("nvim-treesitter/nvim-treesitter-textobjects") },
})

vim.api.nvim_create_autocmd('PackChanged', {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == 'nvim-treesitter' and (kind == 'update' or kind == 'install') then
			if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
			vim.cmd('TSUpdate')
		end
	end
})

require('nvim-treesitter').setup {
	install_dir = vim.fn.stdpath('data') .. '/treesite',
}
