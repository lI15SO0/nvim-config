local function parse_pattern(pattern)
	local lst = {}
	if pattern:find("-") then
		local start_s, end_s = pattern:match("(%d+)-(%d+)")
		local s, e = tonumber(start_s), tonumber(end_s)

		for i = s, e do
			table.insert(lst, i)
		end
	else
		table.insert(lst, tonumber(pattern))
	end
	return lst
end

local function get_input()
	local choice = vim.fn.input { prompt = "Choice ([-,]number / (defaule)[a]ll / esc for cancle): ", cancelreturn = "CANCLED" }

	-- Cancle
	if choice == "CANCLED" then return -1 end

	-- All
	if choice == '' or choice == 'a' or choice == 'all' then return 1 end

	-- Numbers
	if choice:match("^[%d,%-%s]+$") then
		local choices = vim.iter(string.gmatch(choice, '[^,]+'))
			:map(parse_pattern)
			:unique()
			:totable()
		return vim.fn.flatten(choices)
	end

	--- other else
	return 0
end

return {
	cmd = "PackPurge",
	func = function()
		-- Get deactive plugins
		local plugins = vim.pack.get(nil)
		local iter = vim.iter(pairs(plugins))
		local deactive_plugins = iter
			:filter(function(_, v) return not v.active end)
			:map(function(_, v) return v.spec.name end)
			:totable()

		if #deactive_plugins == 0 then
			vim.print("Not found deactive plugins.")
			return
		end

		-- confirm
		vim.print("Find plugins not actived: ")
		vim.iter(pairs(deactive_plugins))
			:each(function(i, v) vim.print(i .. ": " .. v) end)

		local choice = get_input()

		if type(choice) == 'number' then
			if choice == 1 then -- delete all plugin
				vim.pack.del(deactive_plugins)
			elseif choice == -1 then -- cancle
				vim.notify("Cancled!", vim.log.levels.INFO, { title = "PackPurge" })
			elseif choice == 0 then -- Illeagl input
				vim.notify("Illeagl input!", vim.log.levels.ERROR, { title = "PackPurge" })
			end
		else
			local choice_plugins = vim.iter(choice)
				:map(function(e)
					if #deactive_plugins < e then return 0 end
					return deactive_plugins[e]
				end):totable()

			if vim.iter(choice_plugins):any(function(e) return e == 0 end) then
				vim.notify("Illeagl input: out of ranges.", vim.log.levels.ERROR, { title = "PackPurge" })
				return
			end

			vim.pack.del(choice_plugins)
		end
	end,
	desc = "Remove unused plugins."
}
