return {
	{
		"hossein-lap/schemes-nvim",
		dependencies = {
			"tiagovla/tokyodark.nvim",
			"Shatur/neovim-ayu",
			"hossein-lap/vim-hybrid",
			"Mofiqul/dracula.nvim",
			"ishan9299/nvim-solarized-lua",
			"ellisonleao/gruvbox.nvim",
			"hossein-lap/vim-256noir",
			"hossein-lap/vim-sunbather",
			"hossein-lap/vim-paramount",
			"hossein-lap/vim-lupper",
			"hossein-lap/vim-octave",
			"hossein-lap/vim-wal",
			{ "rose-pine/neovim", name = "rose-pine" }
		},

		config = function()
			local scheme = require("schemes")
			scheme.ColorThem({
				-- name = "vim-wal",
				-- name = "hybrid",
				name = "lunaperche",
				-- name = "256_noir",
				-- name = "solarized",
				alpha_enable = false,
				alpha_sec = "basic", -- basic, cols, folds, all
			})
		end
	},
}
