return {
	{
		"chenasraf/text-transform.nvim",
		event = { "BufRead", "BufAdd" },
		config = function()
			require("text-transform").setup({
				-- Prints useful logs about what event are triggered, and reasons actions are executed.
				debug = false,
				-- Keymap to trigger the transform.
				keymap = {
					-- Normal mode keymap.
					["n"] = "<Leader>w",
					-- Visual mode keymap.
					["v"] = "<Leader>w",
				},
			})
		end
	}
}
