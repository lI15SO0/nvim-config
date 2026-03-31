local ts = require('nvim-treesitter')
local install_retry = 3;

local function is_installed(ft)
	local installed = ts.get_installed()
	return vim.tbl_contains(installed, ft)
end

local function f()
	local ft = vim.api.nvim_buf_get_option(0, "filetype")

	-- Check if avaliable
	local avaliable_list = ts.get_available();
	if not vim.tbl_contains(avaliable_list, ft) then
		return
	end

	-- check if install and auto install
	local function _get_notify_msg(filetype, times)
		local msg = filetype .. " treesitter-parser not install, try to installing."
		if times > 0 then
			msg = msg .. " Retrying " .. times .. " times"
		end
		return msg
	end

	local corr = false
	if not is_installed(ft) then
		local retry_times = 0
		while retry_times < install_retry and not corr do
			local msg = _get_notify_msg(ft, retry_times)
			vim.notify(msg, vim.log.levels.INFO, { title = "Treesitter" })

			corr, _ = pcall(function()
				ts.install({ ft }):wait(300000)
			end)
			retry_times = retry_times + 1
		end
	end

	-- enable tree-sitter or notify error.
	if is_installed(ft) then
		vim.treesitter.start()
		if corr then
			local msg = ft .. " treesitter-parser installed and enabled."
			vim.notify(msg, vim.log.levels.INFO, { title = "Treesitter" })
		end
	else
		local msg = ft .. " treesitter-parser not install or failed to installed, pls try install again. "
		vim.notify(msg, vim.log.levels.ERROR, { title = "Treesitter" })
	end
end

return {
	event = { "BufWritePost", "BufReadPost" },
	opts = {
		group = "treesitter",
		callback = f,
		desc = "Neovim Treesitter auto setup.",
		nested = true,
	}
}
