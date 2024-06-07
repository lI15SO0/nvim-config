-- https://github.com/stevearc/aerial.nvim
local options = require("core.options")

return {
	"stevearc/aerial.nvim",
	keys = {
		{ '<leader>a', '<cmd>AerialToggle!<cr>',   mode = 'n', desc = "Toggle Aerial" },
		{ '<leader>s', '<cmd>AerialNavToggle<cr>', mode = 'n', desc = "Toggle Aerial" },
		{ '{',         '<cmd>AerialPrev<cr>',      mode = 'n', desc = "Move cursor to Perv navigation" },
		{ '}',         '<cmd>AerialNext<cr>',      mode = 'n', desc = "Move cursor to Next navigation" },
	},
	config = function()
		require("aerial").setup {
			layout = {
				min_width = 30,
			},
			backends = { "treesitter", "markdown" },
			filter_kind = false,
			nerd_font = "auto",
			update_events = "TextChanged,InsertLeave",

			show_guides = true,

			nav = {
				border = "rounded",
				max_height = 0.9,
				min_height = { 10, 0.7 },
				max_width = 0.3,
				min_width = { 0.3, 20 },

				win_opts = {
					cursorline = true,
					winblend = 10,
				},
				-- Jump to symbol in source window when the cursor moves
				autojump = false,
				-- Show a preview of the code in the right column, when there are no child symbols
				preview = true,
				-- Keymaps in the nav window
				keymaps = {
					["<CR>"] = "actions.jump",
					["o"] = "actions.jump",
					["<2-LeftMouse>"] = "actions.jump",
					["<C-v>"] = "actions.jump_vsplit",
					["<C-s>"] = "actions.jump_split",
					["h"] = "actions.left",
					["l"] = "actions.right",
					["<C-c>"] = "actions.close",
					["q"] = "actions.close",
					["<esc>"] = "actions.close",
				}
			}

		}
	end
}
