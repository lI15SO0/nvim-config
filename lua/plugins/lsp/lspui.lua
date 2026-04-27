local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("j-hui/fidget.nvim") },
	{ src = gh("jinzhongjia/LspUI.nvim") },
	{ src = gh("ray-x/lsp_signature.nvim") },
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("LoadFidget", { clear = true }),
	once = true,
	callback = function()
		require("fidget").setup {}
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LoadLspUI", { clear = true }),
	once = true,
	callback = function()
		require("LspUI").setup {
			prompt = false,
			lightbulb = { enable = true, is_cached = true },
			inlay_hint = { enable = false },
			diagnostic = { enable = false },
			hover = { enable = false },
			definition = { enable = false },
			type_definition = { enable = false },
			declaration = { enable = false },
			implementation = { enable = false },
			reference = { enable = false },
			pos_keybind = {},
			call_hierarchy = { enable = false },
			signature = { enable = false },
		}
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LoadLspSignature", { clear = true }),
	once = true,
	callback = function()
		require("lsp_signature").setup {
			floating_window = false
		}
	end,
})
