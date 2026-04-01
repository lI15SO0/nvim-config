local api = require("api")
local gh = api.plugin.gh

vim.api.nvim_create_autocmd('PackChanged', {
	once = true,
	callback = function(ev)
		local name = ev.data.spec.name
		local kind = ev.data.kind
		local cwd = ev.data.path

		if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then
			local configure = { 'cmake', '-S.', '-Bbuild', '-DCMAKE_BUILD_TYPE=Release' }
			local build_install = { 'cmake', '--build', 'build', '--config', 'Release', '--target', 'install' }

			vim.system(configure, { cwd = cwd }, function(obj)
				if obj.code ~= 0 then
					vim.notify('cmake generate failed', vim.log.levels.ERROR, { title = "telescope-fzf-native" })
					return
				end

				vim.system(build_install, { cwd = cwd }, function(obj)
					if obj.code ~= 0 then
						vim.notify('compile fzf libs failed', vim.log.levels.ERROR, { title = "telescope-fzf-native" })
					end
				end)
			end)
		end
	end,
})

vim.pack.add({
	{ src = gh("nvim-telescope/telescope.nvim") },
	{ src = gh("nvim-telescope/telescope-fzf-native.nvim") },
})

require("telescope").setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	}
})

require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")

api.map.bulk_regist({
	{
		mode = { 'n' },
		key = '<leader>ff',
		fn = function()
			builtin.find_files()
		end,
		options = { silent = true },
		description = 'use Telescope to find files',
	},
	{
		mode = { 'n' },
		key = '<leader>fg',
		fn = function()
			builtin.live_grep()
		end,
		options = { silent = true },
		description = 'use Telescope to find in rg',
	},
	{
		mode = { 'n' },
		key = '<leader>fb',
		fn = function()
			builtin.buffers()
		end,
		options = { silent = true },
		description = 'use Telescope to jump buffer',
	},
	{
		mode = { 'n' },
		key = '<leader>fh',
		fn = function()
			builtin.help_tags()
		end,
		options = { silent = true },
		description = 'use Telescope to show help page',
	},
	{
		mode = { 'n' },
		key = '<leader>fo',
		fn = function()
			builtin.oldfiles()
		end,
		options = { silent = true },
		description = 'use Telescope to find recent open file',
	},
	{
		mode = { 'n' },
		key = '<leader>fm',
		fn = function()
			builtin.marks()
		end,
		options = { silent = true },
		description = 'use Telescope to find marks',
	},
	{
		mode = { "n" },
		key = "<leader>fn",
		fn = function()
			require("telescope").extensions.notify.notify()
		end,
		options = { silent = true },
		description = "Show notices history"
	},
})
