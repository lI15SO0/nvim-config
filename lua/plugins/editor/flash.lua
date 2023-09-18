return {
	"folke/flash.nvim",
	opts = {},
	keys = {
		{"e", mode = {"n", "x", "o"}, function() require("flash").jump() end, desc = "Flash" },
		{"E", mode = {"n", "x", "o"}, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		{"R", mode = {"x", "o"}, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
	}
}
