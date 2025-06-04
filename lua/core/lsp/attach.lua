vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
	callback = function(ev)
		-- Get LSP client
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		require("core.lsp.keymap")

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
		if client and client:supports_method 'textDocument/documentHighlight' then
			local hightlight_augroup = vim.api.nvim_create_augroup('kickstarrrt-lsp-highlight', { clear = false })
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
		end

		-- Offloads upon datachment
		vim.api.nvim_create_autocmd('LspDetach', {
			group = vim.api.nvim_create_augroup('kickstart-lsp-detach', {clear = true}),
			callback = function (ev2)
				vim.lsp.buf.clear_references()
				vim.api.nvim_clear_autocmds{group = 'kickstart-lsp-highlight', buffer = ev2.buf}
			end
		})
	end
})
