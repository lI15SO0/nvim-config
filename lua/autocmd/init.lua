local api = require("api")
local options = require("core.options")

local cmds = api.loader.safe_requires {
	autosave = "autocmd.autosave",
	lastplace = "autocmd.lastplace",
	disable_new_annotation_line = "autocmd.DisableNewLineAnnotation",
	spec_filetype_use_soft_tab = "autocmd.SpecFiletypeUseSoftTab",
}

local groups = {
	'default',
	'autosave',
	'postread',
	'bufenter',
	'bufset'
}

-- create augroup and clear it
for _, x in ipairs(groups) do
	vim.api.nvim_create_augroup(x, { clear = true })
end

-- reg autocmds
for i, x in pairs(cmds) do
	local autocmd_enalble = options.autocmd[i]
	if autocmd_enalble then
		vim.api.nvim_create_autocmd(x.event, x.opts)
	end
end
