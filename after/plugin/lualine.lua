local length = 1

-- colors {{{
local colors = {
--	basic {{{
	basic = {
		black    = '#000000',
		white    = '#ffffff',
		bg       = '#00010A',
		fg       = '#bbc2cf',
		gray     = '#0D1016',
		yellow   = '#ECBE7B',
		cyan     = '#008080',
		darkblue = '#081633',
		green    = '#98be65',
		orange   = '#FF8800',
		violet   = '#a9a1e1',
		purple   = '#c678dd',
		blue     = '#51afef',
		red      = '#ec5f67',
	},
--	}}}
--	ayu {{{
	ayu = {
		purple = '#c678dd',
		accent = '#E6B450',
		-- bg = '#0A0E14',
		fg = '#B3B1AD',
		ui = '#4D5566',
		blue = '#39BAE6',
		-- orange = '#FFB454',
		entity = '#59C2FF',
		green = '#C2D94C',
		cyan = '#95E6CB',
		red = '#F07178',
		orange = '#FF8F40',
		special = '#E6B673',
		gray = '#626A73',
		yellow = '#FFEE99',
		operator = '#F29668',
		error = '#FF3333',
		bg = '#00010A',
		bg1 = '#1B2733',
		bg2 = '#242A35',
		bg3 = '#273747',
		fg_idle = '#3E4B59',
		guide_active = '#393F4D',
		gutter_active = '#464D5E',
		gutter_normal = '#323945',
		panel_bg = '#0D1016',
		panel_border = '#000000',
		panel_shadow = '#00010A',
		selection_border = '#304357',
		vcs_added = '#91B362',
		vcs_added_bg = '#1D2214',
		vcs_modified = '#6994BF',
		vcs_removed = '#D96C75',
		vcs_removed_bg = '#2D2220',
		warning = '#FF8F40',
	},
--	}}}
--	dracula {{{
	dracula = {
		bg = "#282A36",
		fg = "#F8F8F2",
		selection = "#44475A",
		comment = "#6272A4",
		red = "#FF5555",
		orange = "#FFB86C",
		yellow = "#F1FA8C",
		green = "#50fa7b",
		purple = "#BD93F9",
		blue = "#9082f7",
		cyan = "#8BE9FD",
		pink = "#FF79C6",
		bright_red = "#FF6E6E",
		bright_green = "#69FF94",
		bright_yellow = "#FFFFA5",
		bright_blue = "#D6ACFF",
		bright_magenta = "#FF92DF",
		bright_cyan = "#A4FFFF",
		bright_white = "#FFFFFF",
		gray = "#21222C",
		visual = "#3E4452",
		gutter_fg = "#4B5263",
		nontext = "#3B4048",
		white = "#ABB2BF",
		black = "#191A21",
	},
--	}}}
-- tokyodark {{{
	tokyodark = {
		white = "#ffffff",
		black = "#000000",
		bg = "#06080A",
		bg1 = "#11121D",
		gray = "#1A1B2A",
		bg2 = "#212234",
		bg3 = "#353945",
		bg4 = "#4A5057",
		bg5 = "#282c34",
		bg_red = "#FE6D85",
		bg_green = "#98C379",
		bg_blue = "#9FBBF3",
		diff_red = "#773440",
		diff_green = "#587738",
		diff_blue = "#2a3a5a",
		diff_add = "#1E2326",
		diff_change = "#262b3d",
		diff_delete = "#281B27",
		diff_text = "#1c4474",
		fg = "#A0A8CD",
		red = "#EE6D85",
		orange = "#F6955B",
		yellow = "#D7A65F",
		green = "#95C561",
		blue = "#7199EE",
		cyan = "#38A89D",
		purple = "#A485DD",
		grey = "#4A5057",
	},
-- }}}
--	solarized {{{
	solarized = {
		gray    = '#002b36',
		fg      = '#fdf6e3',
		bg      = '#073642',
		base02  = '#073642',
		red     = '#dc322f',
		green   = '#859900',
		yellow  = '#b58900',
		blue    = '#268bd2',
		purple  = '#d33682',
		cyan    = '#2aa198',
		base2   = '#eee8d5',
		base03  = '#002b36',
		back    = '#002b36',
		orange  = '#cb4b16',
		base01  = '#586e75',
		base00  = '#657b83',
		base0   = '#839496',
		violet  = '#6c71c4',
		base1   = '#93a1a1',
		base3   = '#fdf6e3',
		err_bg  = '#fdf6e3',
	},
--	}}}
}

local color = colors.tokyodark
-- }}}

-- conditions {{{
	local conditions = {
		buffer_not_empty = function()
			return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
		end,
		hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end,
		check_git_workspace = function()
			local filepath = vim.fn.expand('%:p:h')
			local gitdir = vim.fn.finddir('.git', filepath .. ';')
			return gitdir and #gitdir > 0 and #gitdir < #filepath
		end,
	}
	-- }}}
	-- configs {{{
		local config = {
			options = {
					always_divide_middle = true,
					globalstatus = true,
				},
				sections = {
					-- these are to remove the defaults
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
					-- These will be filled later
				},
				inactive_sections = {
					-- these are to remove the defaults
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {
					-- these are to remove the defaults
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
					-- These will be filled later
				},
			}
			-- }}}
			-- aliases {{{
				-- insert {{{
					-- lualine_a
					local function botinsert_left_a(component)
						table.insert(config.sections.lualine_a, component)
					end
					-- lualine_b
					local function botinsert_left_b(component)
						table.insert(config.sections.lualine_b, component)
					end
					-- lualine_c
					local function botinsert_left_c(component)
						table.insert(config.sections.lualine_c, component)
					end
					------------------------------------------------------------------------------
					-- lualine_b_inactive
					local function botinsert_inact_b(component)
						table.insert(config.inactive_sections.lualine_b, component)
					end
					------------------------------------------------------------------------------
					-- lualine_x
					local function botinsert_right_x(component)
						table.insert(config.sections.lualine_x, component)
					end
					-- lualine_y
					local function botinsert_right_y(component)
						table.insert(config.sections.lualine_y, component)
					end
					-- lualine_z
					local function botinsert_right_z(component)
						table.insert(config.sections.lualine_z, component)
					end
					---===≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡===---
					-- tabline_a
					local function topinsert_left_a(component)
						table.insert(config.tabline.lualine_a, component)
					end
					-- tabline_b
					local function topinsert_left_b(component)
						table.insert(config.tabline.lualine_b, component)
					end
					-- tabline_c
					local function topinsert_left_c(component)
						table.insert(config.tabline.lualine_c, component)
					end
					------------------------------------------------------------------------------
					-- tabline_x
					local function topinsert_right_x(component)
						table.insert(config.tabline.lualine_x, component)
					end
					-- tabline_y
					local function topinsert_right_y(component)
						table.insert(config.tabline.lualine_y, component)
					end
					-- tabline_z
					local function topinsert_right_z(component)
						table.insert(config.tabline.lualine_z, component)
					end
					-- }}}
					-- basename {{{
						local function Split(s, delimiter)
							local result = {};
							for match in (s..delimiter):gmatch("(.-)"..delimiter) do
								table.insert(result, match);
							end
							return result;
						end
						local function basename()
							local myString = vim.fn.expand('%:p')
							local split_string = Split(myString, "/")

							local i = 0
							for _ in pairs(split_string) do
								i = i + 1
							end
							--  
							local base = string.format(' %s', split_string[i - 1])
							return base
						end
						-- }}}
						-- autofill sym {{{
							local function showautofill()
								local Achar = ''
								local Mchar = ''
								local Schar = ''
								local ft = vim.bo.filetype

								if Autofill then
									Achar = 'α'
								end

								if ft == 'markdown' or ft == 'rmd' then
									if Mautofill then
										Mchar = 'μ'
									end
								end

								if ft == 'sent' or ft == 'text' then
									if Sautofill then
										Mchar = 'Σ'
									end
								end
								return Achar .. Mchar .. Schar
							end
							-- }}}
							-- split sym {{{
								local function ShowSplitMode()
									if WindowStyle then
										return WindowStyle:sub(1,length)
									else
										return ''
									end
								end
								-- }}}
								-- filetype {{{
									local function currfiletype()
										if vim.bo.filetype == '' then
											return 'None'
										else
											return vim.bo.filetype
										end
									end
									-- }}}
									-- }}}
-- compnents {{{
-- top-line {{{
---- sep {{{
--topinsert_left_a {
--	function()
--		return '▊'
--	end,
--	color = { fg = color.blue }, -- Sets highlighting of component
--	padding = { left = 0, right = 0 }, -- We don't need space before this
--}
---- }}}
---- void icon {{{
--topinsert_left_a {
--	function()
--		return ''
--	end,
----	--	color {{{
----	color = function()
----		-- auto change color according to neovims mode
----		local mode_color = {
----			n = color.red,
----			i = color.green,
----			v = color.blue,
----			[''] = color.blue,
----			V = color.blue,
----			c = color.magenta,
----			no = color.red,
----			s = color.orange,
----			S = color.orange,
----			[''] = color.orange,
----			ic = color.yellow,
----			R = color.violet,
----			Rv = color.violet,
----			cv = color.red,
----			ce = color.red,
----			r = color.cyan,
----			rm = color.cyan,
----			['r?'] = color.cyan,
----			['!'] = color.red,
----			t = color.red,
----		}
----		return { fg = mode_color[vim.fn.mode()], bg = color.bg }
----	end,
----	--	}}}
--	padding = { right = 1, left = 1 },
--}
---- }}}
-- evil icon {{{
topinsert_left_a {
	function()
		return ''
	end,
--	--	color {{{
--	color = function()
--		-- auto change color according to neovims mode
--		local mode_color = {
--			n = color.red,
--			i = color.green,
--			v = color.blue,
--			[''] = color.blue,
--			V = color.blue,
--			c = color.magenta,
--			no = color.red,
--			s = color.orange,
--			S = color.orange,
--			[''] = color.orange,
--			ic = color.yellow,
--			R = color.violet,
--			Rv = color.violet,
--			cv = color.red,
--			ce = color.red,
--			r = color.cyan,
--			rm = color.cyan,
--			['r?'] = color.cyan,
--			['!'] = color.red,
--			t = color.red,
--		}
--		return { fg = mode_color[vim.fn.mode()], bg = color.bg }
--	end,
--	--	}}}
	padding = { right = 1, left = 1 },
}
-- }}}
---- gear icon {{{
--topinsert_left_a {
--	function()
--		return ''
--	end,
----	--	color {{{
----	color = function()
----		-- auto change color according to neovims mode
----		local mode_color = {
----			n = color.red,
----			i = color.green,
----			v = color.blue,
----			[''] = color.blue,
----			V = color.blue,
----			c = color.magenta,
----			no = color.red,
----			s = color.orange,
----			S = color.orange,
----			[''] = color.orange,
----			ic = color.yellow,
----			R = color.violet,
----			Rv = color.violet,
----			cv = color.red,
----			ce = color.red,
----			r = color.cyan,
----			rm = color.cyan,
----			['r?'] = color.cyan,
----			['!'] = color.red,
----			t = color.red,
----		}
----		return { fg = mode_color[vim.fn.mode()], bg = color.bg }
----	end,
----	--	}}}
--	padding = { right = 1, left = 1 },
--}
---- }}}
-- Lsp server name {{{
topinsert_left_b {
	function()
		local msg = 'nil'
		local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
--	icon = '',
--	color = { fg = '#ffffff', gui = 'none' },
}
-- }}}
-- diagnostics {{{
topinsert_left_c {
	'diagnostics',
	sources = { 'nvim_diagnostic' },
	symbols = { error = '×', warn = '!', info = '?', hint = '∗' },
	diagnostics_color = {
		color_error = { fg = color.red },
		color_warn = { fg = color.yellow },
		color_info = { fg = color.cyan },
	},
}
-- }}}
-- git-diff {{{
topinsert_left_c {
	'diff',
	-- Is it me or the symbol for modified us really weird
--	symbols = { added = ' ', modified = '柳', removed = ' ' },
	diff_color = {
		added = { fg = color.green },
		modified = { fg = color.orange },
		removed = { fg = color.red },
	},
--	cond = conditions.hide_in_width,
}
-- }}}
--
-- vim icon {{{
topinsert_right_z {
	function()
		return ''
	end,
--	-- color {{{
--	color = function()
--		-- auto change color according to neovims mode
--		local mode_color = {
--			n = color.red,
--			i = color.green,
--			v = color.blue,
--			[''] = color.blue,
--			V = color.blue,
--			c = color.magenta,
--			no = color.red,
--			s = color.orange,
--			S = color.orange,
--			[''] = color.orange,
--			ic = color.yellow,
--			R = color.violet,
--			Rv = color.violet,
--			cv = color.red,
--			ce = color.red,
--			r = color.cyan,
--			rm = color.cyan,
--			['r?'] = color.cyan,
--			['!'] = color.red,
--			t = color.red,
--		}
--		return { fg = mode_color[vim.fn.mode()], bg = color.bg }
--	end,
--	-- }}}
	padding = { right = 1, left = 1 },
}
-- }}}
topinsert_right_x {showautofill} -- autofill char
topinsert_right_x {ShowSplitMode}
topinsert_right_x {'fileformat'} -- fileformat
topinsert_right_x { -- size
	'filesize',
	cond = conditions.buffer_not_empty,
}
topinsert_right_y {
	'branch',
	icon = '',
--	color = { fg = color.violet, gui = 'bold' },
}
---- sep {{{
--topinsert_right_z {
--	function()
--		return '▊'
--	end,
--	color = { fg = color.blue }, -- Sets highlighting of component
--	padding = { left = 0, right = 0 }, -- We don't need space before this
--}
---- }}}
-- }}}

-- inactive {{{
botinsert_inact_b { 'filename' } -- base dir
-- }}}

-- bottom-line {{{
---- mode (evil) {{{
--botinsert_left_b {
--	-- mode component
--	function()
--		return ''
--	end,
--	color = function()
--		-- auto change color according to neovims mode
--		local mode_color = {
--			n = color.red,
--			i = color.green,
--			v = color.blue,
--			[''] = color.blue,
--			V = color.blue,
--			c = color.magenta,
--			no = color.red,
--			s = color.orange,
--			S = color.orange,
--			[''] = color.orange,
--			ic = color.yellow,
--			R = color.violet,
--			Rv = color.violet,
--			cv = color.red,
--			ce = color.red,
--			r = color.cyan,
--			rm = color.cyan,
--			['r?'] = color.cyan,
--			['!'] = color.red,
--			t = color.red,
--		}
--		return { fg = mode_color[vim.fn.mode()] }
--	end,
--	padding = { right = 1, left = 1 },
--}
---- }}}

-- sep {{{
botinsert_left_a {
	function()
		return ' '
	end,
--	color = { fg = color.blue }, -- Sets highlighting of component
	padding = { left = 0, right = 0 }, -- We don't need space before this
}
-- }}}

---- mode {{{
--botinsert_left_a {
--	'mode',
--	fmt = function(str)
--		return str:sub(1,length)
--	end
--}
---- }}}
botinsert_left_b { basename } -- base dir
botinsert_left_b {'%f'} -- filename
botinsert_left_c {'%m'} -- modified sym
botinsert_right_x {'%l/%L:%c'} -- cursor position
--botinsert_right_y {currfiletype} -- file type
-- filetype with icon {{{
botinsert_right_y {
	'filetype',
	colored = false,
	icon_only = false,
	icon = { align = 'left' }
}
-- }}}
---- evil icon {{{
--botinsert_right_z {
--	function()
--		return ''
--	end,
----	--	color {{{
----	color = function()
----		-- auto change color according to neovims mode
----		local mode_color = {
----			n = color.red,
----			i = color.green,
----			v = color.blue,
----			[''] = color.blue,
----			V = color.blue,
----			c = color.magenta,
----			no = color.red,
----			s = color.orange,
----			S = color.orange,
----			[''] = color.orange,
----			ic = color.yellow,
----			R = color.violet,
----			Rv = color.violet,
----			cv = color.red,
----			ce = color.red,
----			r = color.cyan,
----			rm = color.cyan,
----			['r?'] = color.cyan,
----			['!'] = color.red,
----			t = color.red,
----		}
----		return { fg = mode_color[vim.fn.mode()], bg = color.bg }
----	end,
----	--	}}}
--	padding = { right = 1, left = 1 },
--}
---- }}}
-- sep {{{
botinsert_right_z {
	function()
		return ' '
	end,
--	color = { fg = color.blue }, -- Sets highlighting of component
	padding = { left = 0, right = 0 }, -- We don't need space before this
}
-- }}}
--botinsert_right_z {'progress'} -- file progress
-- }}}
-- }}}

-- separators {{{
local separators = {
	none        = { left = '',   right = ''   },
	single      = { left = '›',  right = '‹'  },
	double      = { left = '»',  right = '«'  },
	long        = { left = '⟩',  right = '⟨'  },
	ascii       = { left = '>',  right = '<'  },
	sharp1      = { left = '',  right = ''  },
	pipe        = { left = '|',  right = '|'  },
	brokenpipe  = { left = '¦',  right = '¦'  },
	dash        = { left = '-',  right = '-'  },
	endash      = { left = '–',  right = '–'  },
	emdash      = { left = '—',  right = '—'  },
	arrow       = { left = '→',  right = '←'  },
	arrowduoble = { left = '⇒',  right = '⇐'  },
	slash       = { left = '/',  right = '/'  },
	backslash   = { left = '\\', right = '\\' },
	equal       = { left = '=',  right = '='  },
	sharp2      = { left = '',  right = ''  },
	circle      = { left = '',  right = ''  },
}

config.options.section_separators = separators.none
config.options.component_separators = separators.single
-- }}}
-- set theme {{{
config.options.theme = {
	normal = {
		a = { fg = color.bg, bg = color.red, gui = 'none' },
		b = { fg = color.blue, bg = color.bg, gui = 'none' },
		c = { fg = color.yellow, bg = color.bg, gui = 'none' },

		z = { fg = color.bg, bg = color.red, gui = 'none' },
		y = { fg = color.blue, bg = color.bg, gui = 'none' },
		x = { fg = color.yellow, bg = color.bg, gui = 'none' },
	},
	insert = {
		a = { fg = color.bg, bg = color.green, gui = 'none' },
		b = { fg = color.blue, bg = color.bg, gui = 'none' },
		c = { fg = color.yellow, bg = color.bg, gui = 'none' },

		z = { fg = color.bg, bg = color.green, gui = 'none' },
		y = { fg = color.blue, bg = color.bg, gui = 'none' },
		x = { fg = color.yellow, bg = color.bg, gui = 'none' },
	},
	visual = {
		a = { fg = color.bg, bg = color.yellow, gui = 'none' },
		b = { fg = color.blue, bg = color.bg, gui = 'none' },
		c = { fg = color.yellow, bg = color.bg, gui = 'none' },

		z = { fg = color.bg, bg = color.yellow, gui = 'none' },
		y = { fg = color.blue, bg = color.bg, gui = 'none' },
		x = { fg = color.yellow, bg = color.bg, gui = 'none' },
	},
	replace = {
		a = { fg = color.bg, bg = color.purple, gui = 'none' },
		b = { fg = color.blue, bg = color.bg, gui = 'none' },
		c = { fg = color.yellow, bg = color.bg, gui = 'none' },

		z = { fg = color.bg, bg = color.purple, gui = 'none' },
		y = { fg = color.blue, bg = color.bg, gui = 'none' },
		x = { fg = color.yellow, bg = color.bg, gui = 'none' },
	},
	command = {
		a = { fg = color.bg, bg = color.blue, gui = 'none' },
		b = { fg = color.blue, bg = color.bg, gui = 'none' },
		c = { fg = color.yellow, bg = color.bg, gui = 'none' },

		z = { fg = color.bg, bg = color.blue, gui = 'none' },
		y = { fg = color.blue, bg = color.bg, gui = 'none' },
		x = { fg = color.yellow, bg = color.bg, gui = 'none' },
	},
	inactive = {
		a = { fg = color.fg, bg = color.bg, gui = 'none' },
		b = { fg = color.fg, bg = color.bg, gui = 'none' },
		c = { fg = color.fg, bg = color.bg, gui = 'none' },

		x = { fg = color.fg, bg = color.bg, gui = 'none' },
		y = { fg = color.fg, bg = color.bg, gui = 'none' },
		z = { fg = color.fg, bg = color.bg, gui = 'none' },
	},
}
-- }}}

require('lualine').setup(config)
