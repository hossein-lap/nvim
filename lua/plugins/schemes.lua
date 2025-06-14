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
			"hossein-lap/Alduin",
            "rafi/awesome-vim-colorschemes",
			{ "rose-pine/neovim", name = "rose-pine" },
			-- {
   --              "hossein-lap/vim-tf2",
   --              name = "tf2",
   --              dir = "~/dev/hossein-lap/vim-colors/vim-tf2",
   --          },
			-- {
   --              "hossein-lap/vim-blud",
   --              name = "blud",
   --              dir = "~/dev/hossein-lap/vim-colors/vim-blud",
   --          },
		},

		config = function()
			local scheme = require("schemes")
            vim.cmd [[
                let g:alduin_Shout_Animal_Allegiance = 1
                " set background=light
            ]]
			scheme.ColorThem({
                name = 'hybrid',
				-- name = "alduin",
				-- name = "blud",
				-- name = "vim-wal",
                -- name = 'lunaperche',
				alpha_enable = true,
				alpha_sec = "basic", -- basic, cols, folds, all
			})
		end
	},
}
