--- @class event_obj
--- @field event vim.api.keyset.events|vim.api.keyset.events[]
--- @field opts vim.api.keyset.create_autocmd

local api = require("api")

local cmds = api.loader.safe_requires {
	autosave = "autocmd.autosave",
	lastplace = "autocmd.lastplace",
	disable_new_annotation_line = "autocmd.DisableNewLineAnnotation",
	spec_filetype_use_soft_tab = "autocmd.SpecFiletypeUseSoftTab",
	treesitter_auto_setup = "autocmd.TreesitterAutoSetup",
	treesitter_setup_foldmethod = "autocmd.TreesitterSetupFoldmethod",
}

local groups = {
	'autosave',
	'bufenter',
	'bufset',
	'default',
	'postread',
	'treesitter',
	'treesitter_bootup',
}

-- create augroup and clear it
for _, x in ipairs(groups) do
	vim.api.nvim_create_augroup(x, { clear = true })
end

-- reg autocmds
for _, x in pairs(cmds) do
	vim.api.nvim_create_autocmd(x.event, x.opts)
end
