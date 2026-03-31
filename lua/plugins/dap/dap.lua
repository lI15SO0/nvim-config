local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("mfussenegger/nvim-dap"), },
	{ src = gh("rcarriga/nvim-dap-ui"), },
	{ src = gh("theHamsta/nvim-dap-virtual-text"), },
	{ src = gh("nvim-telescope/telescope-dap.nvim"), },
	{ src = gh("nvim-neotest/nvim-nio"), },
})

local function setup()
	vim.keymap.set('n', '<F5>', function()
		require('telescope').load_extension('dap')
		require('telescope').extensions.dap.configurations {}
	end)
	vim.keymap.set('n', '<F7>', function() require('dap').terminate() end)
	vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
	vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
	vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
	vim.keymap.set('n', '<Leader>-', function() require('dap').toggle_breakpoint() end)
	vim.keymap.set('n', '<Leader>=',
		function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
	vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
	vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
	vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
		require('dap.ui.widgets').hover()
	end)
	vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
		require('dap.ui.widgets').preview()
	end)
	vim.keymap.set('n', '<Leader>df', function()
		local widgets = require('dap.ui.widgets')
		widgets.centered_float(widgets.frames)
	end)
	vim.keymap.set('n', '<Leader>ds', function()
		local widgets = require('dap.ui.widgets')
		widgets.centered_float(widgets.scopes)
	end)

	-- 插件配置
	local dap, dapui = require('dap'), require("dapui")
	require("nvim-dap-virtual-text").setup {}
	dapui.setup()
	dap.listeners.after.event_initialized["dapui_conf"] = function()
		dapui.open()
	end
	dap.listeners.after.event_terminated["dapui_conf"] = function()
		dapui.close()
	end
	dap.listeners.after.event_exited["dapui_conf"] = function()
		dapui.close()
	end
end

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	group = vim.api.nvim_create_augroup("LoadDap", { clear = true }),
	once = true,
	callback = setup,
})
