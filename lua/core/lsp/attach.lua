local commands = require("core.lsp.commands")
local keymap = require("core.lsp.keymap")

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
	callback = function(ev)
		-- Get LSP client
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		-- Basic settings.
		commands.reg_lsp_commands()

		keymap.reg_common_keys()
		keymap.reg_diagnostic_keys()

		-- Folding
		if client and client:supports_method 'textDocument/foldingRange' then
			local win = vim.api.nvim_get_current_win()
			vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
		end

		-- Inlay Hint
		if client and client:supports_method 'textDocument/inlayHint' then
			vim.lsp.inlay_hint.enable()
		end

		-- High Light words under cursor
		local highlight = false;
		if client and client:supports_method 'textDocument/documentHighlight' then
			local hightlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				buffer = ev.buf,
				group = hightlight_augroup,
				callback = vim.lsp.buf.document_highlight
			})

			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				buffer = ev.buf,
				group = hightlight_augroup,
				callback = vim.lsp.buf.clear_references
			})
			highlight = true
		end

		-- Offloads upon datachment
		vim.api.nvim_create_autocmd('LspDetach', {
			group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
			callback = function(ev2)
				if highlight then
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = ev2.buf }
					highlight = false
				end
			end
		})
	end
})
