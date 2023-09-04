return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neoconf.nvim",
			"folke/neodev.nvim",
			"glepnir/lspsaga.nvim",
			{
				"ray-x/lsp_signature.nvim",
				event = "VeryLazy",
				opts = {},
				config = function(_, opts) require 'lsp_signature'.setup(opts) end
			},
		},
		lazy = true,
		event = "VeryLazy",
		config = function()
			vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

			local on_attach = function(_, bufnr)
				local maps = function(keys)
					for _, k in pairs(keys) do
						if k[4].desc then
							k[4].desc = "LSP: " .. k[4].desc
						end

						vim.keymap.set(k[1], k[2], k[3], k[4])
					end
				end

				local tel_builtin = require("telescope.builtin")
				maps {
					{ 'n',        'K',          "<cmd>Lspsaga hover_doc<CR>",			{ desc = "Show hover docs", silent = true } },
					{ 'n',        'gD',         vim.lsp.buf.declaration,				{ desc = "Show declarations", silent = true } },
					{ 'n',        'gd',         tel_builtin.lsp_definitions,			{ desc = "Show definition", silent = true } },
					{ 'n',        'gi',         vim.lsp.buf.implementation,				{ desc = "Show implementation", silent = true } },
					{ 'n',        'gr',         tel_builtin.lsp_references,				{ desc = "Show references", silent = true } },
					{ 'n',        '<A-k>',      vim.lsp.buf.signature_help,				{ desc = "Show Signature help", silent = true } },
					{ 'n',        '<leader>wa', vim.lsp.buf.add_workspace_folder,		{ desc = "Add workspace folder", silent = true } },
					{ 'n',        '<leader>wr', vim.lsp.buf.remove_workspace_folder,	{ desc = "Remove workspace folder", silent = true } },
					{ 'n',        '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { desc = "Show workspace list", silent = true } },
					{ 'n',        '<leader>D',  vim.lsp.buf.type_definition,			{ desc = "Show type definition", silent = true } },
					{ 'n',        '<leader>cn', "<cmd>Lspsaga rename<CR>",				{ desc = "Rename", silent = true } },
					{ 'n',        '<leader>fc', function() vim.lsp.buf.format { async = true } end, { desc = "Formating code", silent = true } },
					{ 'n',        '<leader>da', tel_builtin.diagnostics,				{ desc = "Show diagnostics", silent = true } },
					{ { 'n', 'v' }, '<leader>ca', "<cmd>Lspsaga code_action<CR>",		{ desc = "Show code action", silent = true } },
					{ { 'n', 'v' }, '<leader>2', "<cmd>Lspsaga outline<CR>",			{ desc = "Show outlines", silent = true } },
				}
			end

			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			require("neoconf").setup()
			require("neodev").setup()
			require("lspsaga").setup()
			require("mason").setup()
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup {
							settings = require("mason-registry").get_all_packages()[server_name],
							on_attach = on_attach,
							capabilities = capabilities,
						}
					end
				}
			})
		end
	}
}
