return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"HiPhish/rainbow-delimiters.nvim",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
		config = function()
			require('nvim-treesitter').setup {
				install_dir = vim.fn.stdpath('data') .. '/treesite',
			}
		end
	}
}
