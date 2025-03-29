local options = require("core.options")

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neoconf.nvim",
			{
				"ray-x/lsp_signature.nvim",
				opts = {},
				config = function(_, opts) require 'lsp_signature'.setup(opts) end
			},
		},
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
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
					{ 'n',          'K',          "<cmd>LspUI hover<cr>",                                                  { desc = "Show hover docs", silent = true } },
					{ 'n',          'gD',         vim.lsp.buf.declaration,                                                 { desc = "Show declarations", silent = true } },
					{ 'n',          'gd',         tel_builtin.lsp_definitions,                                             { desc = "Show definition", silent = true } },
					{ 'n',          'gi',         vim.lsp.buf.implementation,                                              { desc = "Show implementation", silent = true } },
					{ 'n',          'gr',         tel_builtin.lsp_references,                                              { desc = "Show references", silent = true } },
					{ 'n',          '<A-k>',      vim.lsp.buf.signature_help,                                              { desc = "Show Signature help", silent = true } },
					{ 'n',          '<leader>wa', vim.lsp.buf.add_workspace_folder,                                        { desc = "Add workspace folder", silent = true } },
					{ 'n',          '<leader>wr', vim.lsp.buf.remove_workspace_folder,                                     { desc = "Remove workspace folder", silent = true } },
					{ 'n',          '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { desc = "Show workspace list", silent = true } },
					{ 'n',          '<leader>D',  vim.lsp.buf.type_definition,                                             { desc = "Show type definition", silent = true } },
					{ 'n',          '<leader>cn', "<cmd>LspUI rename<CR>",                                                 { desc = "Rename", silent = true } },
					{ 'n',          '<leader>fc', function() vim.lsp.buf.format { async = true } end,                      { desc = "Formating code", silent = true } },
					{ 'n',          '<leader>da', tel_builtin.diagnostics,                                                 { desc = "Show diagnostics", silent = true } },
					-- { 'n',			'<leader>da', "<cmd>LspUI diagnostic<cr>",				{ desc = "Show diagnostics", silent = true } },
					{ { 'n', 'v' }, '<leader>ca', "<cmd>LspUI code_action<CR>",                                            { desc = "Show code action", silent = true } },
				}
			end

			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			require("neoconf").setup()
			require("mason").setup {
				PATH = "append",
				ui = {
					border = options.ui.float_border,
				}
			}

			options.lsp.configured = {}

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						if options.lsp.config[server_name] == nil then
							options.lsp.configed[server_name] = {
								on_attach = on_attach,
								capabilities = capabilities,
							}
						else
							options.lsp.configed[server_name] = vim.tbl_deep_extend(
								"keep",
								{
									on_attach = on_attach,
									capabilities = capabilities,
								},
								options.lsp.config[server_name]
							)
						end
					end
				}
			})


			if options.lsp.manual == "full" then
				vim.notify(
					"Full manual lspconfig mod. You can set lspconfig at .nvim.lua file.",
					vim.log.levels.INFO,
					{ title = "LSP Config" }
				)
			elseif options.lsp.manual == "true" then
				vim.api.nvim_create_user_command(
					"EnableLsp",
					function(opts)
						if opts.fargs[1] == nil then
							vim.notify(
								"Must give a lsp name to enable a lsp.",
								vim.log.levels.WARN,
								{ title = "LSP Config" }
							)
							return
						end
						local lsp_name = opts.fargs[1]

						if options.lsp.configed[lsp_name] == nil then
							vim.notify(
								'LSP servicet "' .. lsp_name .. '" not exists or not install.',
								vim.log.levels.WARN,
								{ title = "LSP Config" }
							)
							return
						end

						local lsp_conf = options.lsp.configed[lsp_name]
						require("lspconfig")[lsp_name].setup(lsp_conf)
						vim.notify(
							'Enable LSP service "' .. lsp_name .. '" successfully.',
							vim.log.levels.INFO,
							{ title = "LSP Config" }
						)
					end,
					{
						desc = "Manully enable a lsp service.",
						nargs = 1
					}
				)
			else
				for lsp_name, lsp_conf in pairs(options.lsp.configed) do
					require("lspconfig")[lsp_name].setup(lsp_conf)
				end
			end
		end
	}
}
