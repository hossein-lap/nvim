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
		},

		config = function()
			local scheme = require("schemes")
			scheme.ColorThem({
				name = "hybrid",
				alpha_enable = true,
				alpha_sec = "cols", -- basic, cols, folds, all
			})
		end
	},
}
