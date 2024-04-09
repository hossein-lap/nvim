return {
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			local devicon = require'nvim-web-devicons'
			devicon.setup {
				color_icons = false,
			}
		end
	},
}
