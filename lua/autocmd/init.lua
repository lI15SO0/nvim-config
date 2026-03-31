local api = require("api")

local cmds = api.loader.safe_requires {
	autosave = "autocmd.autosave",
	lastplace = "autocmd.lastplace",
	disable_new_annotation_line = "autocmd.DisableNewLineAnnotation",
	spec_filetype_use_soft_tab = "autocmd.SpecFiletypeUseSoftTab",
	treesitter_auto_setup = "autocmd.TreesitterAutoSetup"
}

local groups = {
	'default',
	'autosave',
	'postread',
	'bufenter',
	'bufset',
	'treesitter'
}

-- create augroup and clear it
for _, x in ipairs(groups) do
	vim.api.nvim_create_augroup(x, { clear = true })
end

-- reg autocmds
for _, x in pairs(cmds) do
	vim.api.nvim_create_autocmd(x.event, x.opts)
end
