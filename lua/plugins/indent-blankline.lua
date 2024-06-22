return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		local highlight = {
			"Comment",
		}
		local hooks = require "ibl.hooks"
		vim.g.rainbow_delimiters = { highlight = highlight }
		require("ibl").setup {
			indent = { highlight = highlight, char = "⎪" },
			whitespace = {
				highlight = highlight,
				remove_blankline_trail = false,
			},
		}
		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end
}
