-- https://github.com/AndrewRadev/switch.vim

local switch_words = {
    {"true", "false"},
    {"on", "off"},
    {"yes", "no"},
    {"disable", "enable"},
    {"+", "-"},
	{"*", "/"},
    {">", "<"},
    {"=", "!="},
    {"left", "right"},
    {"up", "down"},
    {"start", "stop"},
    {"&&", "||"},
    {"&", "|"},
    {"more", "less"},
	{"top", "bottom"},
	{"max", "min"},
	{"big", "small"},
	{"long", "short"},
	{"front", "back"},
	{"public", "private"},
	{"begin", "end"},
	{"less", "greater"},
	{"fast", "slow"},
}

local push_words = {}

return {
	"AndrewRadev/switch.vim",
	keys = {
		{mode = {'n'}, "gs", "<cmd>Switch<CR>", desc = "Switch!", {slient = true}}
	},
	config = function()

		for _, value in ipairs(switch_words) do
			local w1, w2 = value[1], value[2]
			-- 全小写
			table.insert(push_words, value)
			-- 全大写
			table.insert(push_words, {string.upper(w1), string.upper(w2)})
			-- 首字母大写，%l 代表小写字母，只取第一个
			w1, _ = string.gsub(w1, "^%l", string.upper)
			w2, _ = string.gsub(w2, "^%l", string.upper)
			table.insert(push_words, {w1, w2})
		end

		vim.g.switch_custom_definitions = push_words

	end
}
