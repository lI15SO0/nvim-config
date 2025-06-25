-- https://github.com/akinsho/bufferline.nvim

return {
	"akinsho/bufferline.nvim",
	-- event = "VeryLazy",
	event = {"BufRead", "BufAdd"},
	config = function()
		local api = require("api")
		api.map.bulk_regist({
			{
				mode = {'n'},
				key = "<leader>bh",
				fn = "<cmd>BufferLineCloseLeft<CR>",
				options = {silent = true},
				description = "Close all left tab",
			},
			{
				mode = {'n'},
				key = "<leader>bl",
				fn = "<cmd>BufferLineCloseRight<CR>",
				options = {silent = true},
				description = "Close all right tab",
			},
		})

		require("bufferline").setup(
			{
				options = {
					numbers = "none",
					diagnostics = "nvim_lsp",
					-- indicator_icon = "▎",
					buffer_close_icon = "",
					modified_icon = "●",
					close_icon = "",
					left_trunc_marker = "",
					right_trunc_marker = "",
					separator_style = "slant",
					offsets = {
						{
							filetype = "neo-tree",
							text = "NeoTree",
							highlight = "Directory",
							text_align = "center",
						},
						{
							filetype = "NvimTree",
							text = "File Explorer",
							highlight = "Directory",
							text_align = "center",
						},
						{
							filetype = "aerial",
							text = "Outline Explorer",
							highlight = "Directory",
							text_align = "center",
						},
						{
							filetype = "undotree",
							text = "Undo Explorer",
							highlight = "Directory",
							text_align = "center",
						},
						{
							filetype = "dbui",
							text = "Database Explorer",
							highlight = "Directory",
							text_align = "center",
						},
						{
							filetype = "spectre_panel",
							text = "Project Blurry Search",
							highlight = "Directory",
							text_align = "center",
						},
						{
							filetype = "toggleterm",
							text = "Integrated Terminal",
							highlight = "Directory",
							text_align = "center",
						},
						{
							filetype = "FTerm",
							text = "Integrated Terminal",
							highlight = "Directory",
							text_align = "center",
						},
					},
					-- 显示 LSP 报错图标
					diagnostics_indicator = function(count, level, diagnostics_dict, context)
						local s = " "
						for e, n in pairs(diagnostics_dict) do
							local sym = e == "error" and " " or (e == "warning" and " " or " ")
							s = s .. n .. sym
						end
						return s
					end
				}
			}
		)
	end
}
