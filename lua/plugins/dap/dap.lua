return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
		"nvim-neotest/nvim-nio",
	},
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		vim.keymap.set('n', '<F5>', function()
			require('telescope').load_extension('dap')
			require('telescope').extensions.dap.configurations{}
		end)
		vim.keymap.set('n', '<F7>', function() require('dap').terminate() end)
		vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
		vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
		vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
		vim.keymap.set('n', '<Leader>-', function() require('dap').toggle_breakpoint() end)
		vim.keymap.set('n', '<Leader>=', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
		vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
		vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
		vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
			require('dap.ui.widgets').hover()
		end)
		vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
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

		local dap, dapui = require('dap'), require("dapui")
		require("nvim-dap-virtual-text").setup()
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
}

