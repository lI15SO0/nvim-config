-- https://github.com/AndrewRadev/switch.vim

local switch_words = {
	{ "true",    "false" },
	{ "on",      "off" },
	{ "yes",     "no" },
	{ "disable", "enable" },
	{ "+",       "-" },
	{ "*",       "/" },
	{ ">",       "<" },
	{ "==",      "!=" },
	{ "left",    "right" },
	{ "up",      "down" },
	{ "start",   "stop" },
	{ "&&",      "||" },
	{ "&",       "|" },
	{ "more",    "less" },
	{ "top",     "bottom" },
	{ "max",     "min" },
	{ "big",     "small" },
	{ "long",    "short" },
	{ "front",   "back" },
	{ "public",  "private" },
	{ "begin",   "end" },
	{ "less",    "greater" },
	{ "fast",    "slow" },
	{ "lt",      "gt" }
}

local push_words = {}

local api = require("api")
local gh = api.plugin.gh

vim.pack.add({
	{ src = gh("AndrewRadev/switch.vim") },
})

local function setup()
	for _, value in ipairs(switch_words) do
		local w1, w2 = value[1], value[2]

		table.insert(push_words, value)
		table.insert(push_words, { string.upper(w1), string.upper(w2) })

		local cap_w1, _ = string.gsub(w1, "^%l", string.upper)
		local cap_w2, _ = string.gsub(w2, "^%l", string.upper)

		table.insert(push_words, { cap_w1, cap_w2 })
	end

	vim.g.switch_custom_definitions = push_words
end

local keymaps = {
	{
		mod = "n",
		lhs = "gs",
		rhs = function() vim.cmd("Switch") end,
		opts = { silent = true, desc = "Switch!" }
	}
}

api.plugin.keys_setup("switch", keymaps, setup)
