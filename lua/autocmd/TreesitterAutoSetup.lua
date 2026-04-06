local ts = require('nvim-treesitter')
local install_retry = 5;
local pending = {}

local function is_installed(ft)
	local installed = ts.get_installed()
	return vim.tbl_contains(installed, ft)
end

local function get_notify_msg(filetype, times, errmsg)
	local msg = filetype .. " treesitter-parser not install, try to installing."
	if times > 0 then
		msg = msg .. " Retrying " .. times .. " times"
	end

	if errmsg ~= nil then
		msg = msg .. "\nErr msg: \n" .. errmsg
	end
	return msg
end

local function install_async(ft, times)
	if times >= install_retry then
		local msg = ft .. " treesitter-parser not install or failed to installed, pls try install again. "
		vim.notify(msg, vim.log.levels.ERROR, { title = "Treesitter" })
		return false
	end

	local task = ts.install { ft }
	task:await(function(err, ...)
		if is_installed(ft) then
			local msg = ft .. " treesitter-parser installed and enabled."
			vim.notify(msg, vim.log.levels.INFO, { title = "Treesitter" })
			vim.treesitter.start()
			pending[ft] = nil
			return true
		else
			local msg = get_notify_msg(ft, times + 1, err)
			vim.notify(msg, vim.log.levels.INFO, { title = "Treesitter" })
			return install_async(ft, times + 1)
		end
	end)
end

local function f()
	local ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })

	-- Check if avaliable
	local avaliable_list = ts.get_available();
	if not vim.tbl_contains(avaliable_list, ft) then
		return
	end

	-- If Installed, then enalbe it.
	if is_installed(ft) then
		vim.treesitter.start()
		return
	end

	-- Install ft parser.
	if pending[ft] == nil then
		pending[ft] = true
		local msg = get_notify_msg(ft, 0)
		vim.notify(msg, vim.log.levels.INFO, { title = "Treesitter" })
		install_async(ft, 0)
	end
end

--- @type event_obj
return {
	event = { 'BufEnter' },
	opts = {
		group = "treesitter",
		callback = f,
		desc = "Neovim Treesitter auto setup.",
		nested = true,
	}
}
