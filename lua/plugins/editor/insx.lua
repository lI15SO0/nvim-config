return {
	"hrsh7th/nvim-insx",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local pairs = {
			{ '(', ')' },
			{ '[', ']' },
			{ '<', '>' },
			{ '{', '}' },
		}

		local esc = require('insx').helper.regex.esc

		for _, x in ipairs(pairs) do
			local open_close_pat = {
				open_pat = esc(x[1]),
				close_pat = esc(x[2]),
			}

			require('insx').add('<Space>', require('insx.recipe.pair_spacing').increase(open_close_pat))
			require('insx').add('<BS>', require('insx.recipe.pair_spacing').decrease(open_close_pat))

			local open_close_arg_html_pat = {
				open_pat = esc(x[1]),
				close_pat = esc(x[2]),
				arguments = true,
				html_attrs = true,
				html_tags = true,
			}
			require('insx').add('<CR>', require('insx.recipe.fast_break')(open_close_arg_html_pat))
		end
	end
}
