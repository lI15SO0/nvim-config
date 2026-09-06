local api = require('api')

local notify = function(msg, level)
	if level == nil then
		level = vim.log.levels.INFO
	end
	vim.notify(msg, level, { title = "Zig Test" })
end

api.functools.run_once(api.command.reg_command,
	{
		cmd = "ZigTest",
		func = function(args)
			local filenames = { vim.api.nvim_buf_get_name(0) }

			if #args.args ~= 0 then
				filenames = vim.split(args.args, ' ')
			end

			for _, filename in pairs(filenames) do
				local stdout = ""
				local stderr = ""
				local job_id = vim.fn.jobstart({ 'zig', 'test', filename }, {
					on_stdout = function(_, data)
						for _, v in pairs(data) do
							stdout = stdout .. v .. '\n'
						end
					end,
					on_stderr = function(_, data)
						for _, v in pairs(data) do
							stderr = stderr .. v .. '\n'
						end
					end,
					on_exit = function(_, code, _)
						if code ~= 0 then
							notify(string.format("Test error: %s code: %d\nstderr: \"%s\"", filename, code, stderr))
						else
							notify(string.format("Test passed: %s code: %d", filename, code))
						end
					end
				})

				if job_id <= 0 then
					notify("Failed to create test process with filename: " .. filename, vim.log.levels.ERROR)
				end
			end
		end,
		desc = "Test current zig file or specific zig file",
		opts = {
			nargs = '?',
			complete = 'file'
		}
	}
)
