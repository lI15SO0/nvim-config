local api = require('api')
local nio = require('nio')

local notify = function(msg, level)
	vim.notify(msg, level, { title = "Zig Test" })
end

local runned = false

if not runned then
	runned = true

	api.command.reg_command({
		cmd = "ZigTest",
		func = function(args)
			local filenames = { vim.api.nvim_buf_get_name(0) }

			if #args.args ~= 0 then
				filenames = vim.split(args.args, ' ')
			end

			for _, filename in pairs(filenames) do
				nio.run(function()
					local process = nio.process.run(
						{ cmd = "zig", args = { 'test', filename } }
					)

					if not process then
						notify("Failed to create test process with filename: " .. filename, vim.log.levels.ERROR)
						return
					end
					local code, _ = process.result(true);

					-- FIX: stderr not read, cause EBADF: bad file descriptor.
					if code == 1 then
						local output = process.stderr.read();
						notify(string.format("Test error: %s code: %d\nstderr: \"%s\"", filename, code, output),
							vim.log.levels.INFO)
					else
						notify(string.format("Test done: %s code: %d", filename, code),
							vim.log.levels.INFO)
					end

					process.close()
				end)
			end
		end,
		desc = "Test current zig file or specific zig file",
		opts = {
			nargs = '?',
			complete = 'file'
		}
	})
end
