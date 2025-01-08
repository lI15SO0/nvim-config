return {
	{
		"chenasraf/text-transform.nvim",
		keys = {
			{
				"<Leader>w",
				":TextTransform<CR>",
				mode = { 'n', 'v' },
				desc = "Transform text via different transformer.",
				{ silent = true }
			} },

		opts = {
			-- Prints useful logs about what event are triggered, and reasons actions are executed.
			debug = false,
			-- Keymap to trigger the transform.
			keymap = {
				-- Normal mode keymap.
				["n"] = "<Leader>w",
				-- Visual mode keymap.
				["v"] = "<Leader>w",
			},
		},
	}
}
