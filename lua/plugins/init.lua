return {
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			if os.getenv("TERM") ~= "xterm" then
				if os.getenv("TERM") ~= "linux" then
					local devicon = require('nvim-web-devicons')
					devicon.setup {
						color_icons = false,
					}
				end
			end
		end
	},
}
