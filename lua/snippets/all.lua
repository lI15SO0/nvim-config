local api = require("api")

local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require "luasnip.util.events"
local ai = require "luasnip.nodes.absolute_indexer"
local extras = require "luasnip.extras"
local fmt = extras.fmt
local m = extras.m
local l = extras.l
local postfix = require "luasnip.extras.postfix".postfix

local snippets = {}
--- @param snip table
local sa = function(snip)
	for _, sn in pairs(snip) do
		table.insert(snippets, sn)
	end
end

--------------------------------------------------------------------------------

local postfixs = {
	{ '.qu',  { "'" } },
	{ '.dqu', { '"' } }
}

local function make_postfix_function(quote)
	if #quote == 1 then
		table.insert(quote, quote[1])
	end

	return function(_, parent)
		return quote[1] .. parent.snippet.env.POSTFIX_MATCH .. quote[2]
	end
end

for _, _postfix in pairs(postfixs) do
	sa({
		postfix(_postfix[1], {
			f(make_postfix_function(_postfix[2]), {})
		}),
	})
end

return snippets
