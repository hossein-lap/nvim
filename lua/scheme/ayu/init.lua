local colors = require('ayu.colors')
colors.generate()

require('ayu').setup({
	-- Set to `true` to use `mirage` variant instead of `dark` for dark background.
	mirage = true,

	-- A dictionary of group names, each associated with
	-- a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
	overrides = function()
			if vim.o.background == 'dark' then
				return {
					Comment = { fg = colors.comment },
					NormalNC = {bg = '#0f151e', fg = '#808080'}
				}
			else
				return {
					Comment = { fg = colors.comment },
					NormalNC = {bg = '#f0f0f0', fg = '#808080'}
				}
			end

--			return {
--				Comment = { fg = colors.comment },
----				IncSearch = { fg = colors.fg },
--			}
		end,
	})
