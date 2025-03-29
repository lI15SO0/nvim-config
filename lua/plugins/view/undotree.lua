-- https://github.com/mbbill/undotree
local options = require("core.options")
local api = require("api")

return {
	"mbbill/undotree",
	event = "VeryLazy",
	config = function()
		api.map.register({
			mode = { 'n' },
			key = '<leader>2',
			fn = "<cmd>UndotreeToggle<CR>",
			options = { silent = true },
			description = "Toggle undotree",
		})

		vim.g.undotree_dir = options.path.undotree_dir

		vim.cmd(
			[[
			if has("persistent_undo")
				" 在 config.lua 中定义好了 undotree_dir 全局变量
				let target_path = expand(undotree_dir)
			endif
			if !isdirectory(target_path)
				call mkdir(target_path, "p", 0700)
			endif
			let &undodir = target_path
			set undofile
			]]
		)
	end
}
