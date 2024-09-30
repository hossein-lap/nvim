return {
	{
		"akinsho/toggleterm.nvim",

		config = function()
			local width = math.floor(vim.api.nvim_get_option("columns") / 2)
			local height = math.floor(vim.api.nvim_get_option("lines") / 2)
			local xpad = (width * 2) - math.floor(vim.api.nvim_get_option("columns") / 8)
			local ypad = (height * 2) - math.floor(vim.api.nvim_get_option("lines") / 5)
            local colt = require("colt").config({
                shell = "zsh"
            })

			require'toggleterm'.setup {
				size = function(term)
					if term.direction == "horizontal" then
						return height
					elseif term.direction == "vertical" then
						return width
					end
				end,

				winbar = {
					enabled = true,
					name_formatter = function(Terminal) --  term: Terminal
						return string.gsub(Terminal.name, ';.*', '')
					end
				},

				highlights = {
					Normal = {
						guibg = 'NONE',
					},
					NormalFloat = {
						link = 'Normal'
					},
					FloatBorder = {
						link = 'String',
					},
				},

				direction = 'float',

				float_opts = {
					border = 'single',
					-- border = 'curved',
					winblend = 0,
					width  = xpad,
					height = ypad,
					zindex = 50,
				},

				shell = colt.shell,
				open_mapping = [[<C-q>]],
				hide_numbers = true, -- hide the number column in toggleterm buffers
				shade_terminals = true,
				shade_filetypes = {"none"},
				start_in_insert = true,
				close_on_exit = false,
			}
		end
	}
}
