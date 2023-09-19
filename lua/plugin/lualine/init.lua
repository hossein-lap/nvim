-- local length = 3

-- colors {{{
local colors = {
--	none {{{
	none = {
		black    = '#181818',
		white    = '#ffffff',
		bg       = '#232323',
		fg       = '#bbc2cf',
		gray     = '#777777',
		yellow   = '#F3E430',
		cyan     = '#77eeff',
		darkblue = '#081633',
		green    = '#33cc33',
		orange   = '#ff9c00',
		violet   = '#ff5f87',
		purple   = '#d6acff',
		blue     = '#00aaff',
		red      = '#d70000',
	},
--	}}}
--	basic {{{
	basic = {
		black    = '#191919',
		white    = '#ffffff',
		bg       = '#232323',
		fg       = '#bbc2cf',
		gray     = '#0D1016',
		yellow   = '#ECBE7B',
		cyan     = '#0022ff',
		darkblue = '#081633',
		green    = '#98be65',
		orange   = '#FF8800',
		violet   = '#a9a1e1',
		purple   = '#c678dd',
		blue     = '#00aaff',
		red      = '#ec5f67',
	},
--	}}}
--	noir {{{
	noir = {
		black    = '#181818',
		white    = '#cccccc',
		bg       = '#232323',
		fg       = '#bbc2cf',
		gray     = '#777777',
		yellow   = '#cccccc',
		cyan     = '#cccccc',
		darkblue = '#cccccc',
		green    = '#cccccc',
		orange   = '#cccccc',
		violet   = '#cccccc',
		purple   = '#cccccc',
		blue     = '#cccccc',
		red      = '#cccccc',
		special  = '#ffaf5f',
	},
--	}}}
--	hybrid {{{
	hybrid = {
		black    = '#000000',
		white    = '#c5c8c6',
		bg       = '#111111',
		fg       = '#c5c8c6',
		gray     = '#707880',
		yellow   = '#f0c674',
		cyan     = '#8abeb7',
		darkblue = '#00005f',
		green    = '#b5bd68',
		orange   = '#de935f',
		violet   = '#d7d7ff',
		purple   = '#b294bb',
		blue     = '#81a2be',
		red      = '#cc6666',
	},
--	}}}
--	ayu {{{
--	ayu = {
	["ayu-dark"] = {
		purple = '#c678dd',
		accent = '#E6B450',
		black = '#000000',
		fg = '#B3B1AD',
		ui = '#4D5566',
		white = "#ffffff",
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
		black = "#191A21",
		bg = "#21222C",
		fg = "#F8F8F2",
		selection = "#44475A",
		comment = "#6272A4",
		red = "#FF5555",
		orange = "#FFB86C",
		yellow = "#F1FA8C",
		green = "#50fa7b",
		blue = "#BD93F9",
		purple = "#9082f7",
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
	},
--	}}}
-- tokyodark {{{
	tokyodark = {
--		white = "#ffffff",
		black = "#000000",
		bg = "#06080A",
		bg1 = "#11121D",
		gray = "#1A1B2A",
		bg2 = "#212234",
		bg3 = "#353945",
		white = "#4A5057",
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
		black   = '#002028',
		orange  = '#cb4b16',
		base01  = '#586e75',
		base00  = '#657b83',
		base0   = '#839496',
		violet  = '#6c71c4',
		base1   = '#93a1a1',
		white   = '#93a1a1',
		base3   = '#fdf6e3',
		err_bg  = '#fdf6e3',
	},
--	}}}
--	gruvbox {{{
	gruvbox = {
		black    = '#1d2021',
		white    = '#ebdbb2',
		bg       = '#32302f',
		fg       = '#ebdbb2',
		gray     = '#928374',
		yellow   = '#fabd2f',
		cyan     = '#8ec07c',
		darkblue = '#458588',
		green    = '#b8bb26',
		orange   = '#fabd2f',
		violet   = '#d3869b',
		purple   = '#d3869b',
		blue     = '#83a598',
		red      = '#fb4934',
	},
--	}}}
-- onedark {{{
	onedark = {
		black    = '#0e1013',
		white    = '#b1b4b9',
		bg       = '#181a1f',
		fg       = '#abb2bf',
		gray     = '#5c6370',
		yellow   = '#e5c07b',
		cyan     = '#56b6c2',
		blue     = '#61afef',
		green    = '#98c379',
		orange   = '#d19a66',
		violet   = '#c678dd',
		purple   = '#c678dd',
		darkblue = '#73b8f1',
		red      = '#e86671',
	},
-- }}}
}
-- }}}

local color = colors[CurrentColorscheme] or colors.noir
-- local color = colors["ayu-dark"]

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
		tabline = false,
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
		-- -- these are to remove the defaults
		-- lualine_a = {},
		-- lualine_b = {},
		-- lualine_c = {},
		-- lualine_x = {},
		-- lualine_y = {},
		-- lualine_z = {},
		-- -- These will be filled later
	},
}
-- }}}

-- set theme {{{
config.options.theme = {
	normal = {
		a = { fg = color.red,    bg = color.black,  gui = 'none' },
		b = { fg = color.blue,   bg = color.black,  gui = 'none' },
		c = { fg = color.fg,     bg = color.bg,     gui = 'none' },

		x = { fg = color.fg,     bg = color.bg,     gui = 'none' },
		y = { fg = color.blue,   bg = color.black,  gui = 'none' },
		z = { fg = color.green,  bg = color.black,  gui = 'none' },
	},
	insert = {
		a = { fg = color.red,    bg = color.black,  gui = 'none' },
		b = { fg = color.green,  bg = color.black,  gui = 'none' },
		c = { fg = color.fg,     bg = color.bg,     gui = 'none' },

		x = { fg = color.fg,     bg = color.bg,     gui = 'none' },
		y = { fg = color.green,  bg = color.black,  gui = 'none' },
		z = { fg = color.bg,     bg = color.green,  gui = 'none' },
	},
	visual = {
		a = { fg = color.red,    bg = color.black,  gui = 'none' },
		b = { fg = color.yellow, bg = color.black,  gui = 'none' },
		c = { fg = color.fg,     bg = color.bg,     gui = 'none' },

		x = { fg = color.fg,     bg = color.bg,     gui = 'none' },
		y = { fg = color.yellow, bg = color.black,  gui = 'none' },
		z = { fg = color.green,  bg = color.black,  gui = 'none' },
	},
	replace = {
		a = { fg = color.bg,     bg = color.red,    gui = 'none' },
		b = { fg = color.red,    bg = color.black,  gui = 'none' },
		c = { fg = color.fg,     bg = color.bg,     gui = 'none' },

		x = { fg = color.fg,     bg = color.bg,     gui = 'none' },
		y = { fg = color.red,    bg = color.black,  gui = 'none' },
		z = { fg = color.green,  bg = color.black,  gui = 'none' },
	},
	command = {
		a = { fg = color.red,    bg = color.black,  gui = 'none' },
		b = { fg = color.purple, bg = color.black,  gui = 'none' },
		c = { fg = color.fg,     bg = color.bg,     gui = 'none' },

		x = { fg = color.fg,     bg = color.bg,     gui = 'none' },
		y = { fg = color.purple, bg = color.black,  gui = 'none' },
		z = { fg = color.green,  bg = color.black,  gui = 'none' },
	},
	inactive = {
		a = { fg = color.fg,     bg = color.bg,     gui = 'none' },
		b = { fg = color.fg,     bg = color.black,  gui = 'none' },
		c = { fg = color.fg,     bg = color.bg,     gui = 'none' },

		x = { fg = color.fg,     bg = color.bg,     gui = 'none' },
		y = { fg = color.fg,     bg = color.black,  gui = 'none' },
		z = { fg = color.fg,     bg = color.bg,     gui = 'none' },
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
-- ---===≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡===---
-- -- tabline_a
-- local function topinsert_left_a(component)
-- 	table.insert(config.tabline.lualine_a, component)
-- end
-- -- tabline_b
-- local function topinsert_left_b(component)
-- 	table.insert(config.tabline.lualine_b, component)
-- end
-- -- tabline_c
-- local function topinsert_left_c(component)
-- 	table.insert(config.tabline.lualine_c, component)
-- end
-- ------------------------------------------------------------------------------
-- -- tabline_x
-- local function topinsert_right_x(component)
-- 	table.insert(config.tabline.lualine_x, component)
-- end
-- -- tabline_y
-- local function topinsert_right_y(component)
-- 	table.insert(config.tabline.lualine_y, component)
-- end
-- -- tabline_z
-- local function topinsert_right_z(component)
-- 	table.insert(config.tabline.lualine_z, component)
-- end
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
	--   
	local base = string.format('%s', split_string[i - 1])
	if base == 'nil' then
		return ''
	else
		return ''..base
	end
end
-- }}}

-- filename {{{
local function filename()
	local name = vim.fn.expand("%")
	if name == nil then
		return ''
	else
		return name
	end
end
-- }}}

-- -- autofill sym {{{
-- local function showautofill()
-- 	local Achar = ''
-- 	local Mchar = ''
-- 	local Schar = ''
-- 	local ft = vim.bo.filetype
--
-- 	if Autofill then
-- 		Achar = 'α'
-- 	end
--
-- 	if ft == 'markdown' or ft == 'rmd' then
-- 		if Mautofill then
-- 			Mchar = 'μ'
-- 		end
-- 	end
--
-- 	if ft == 'sent' or ft == 'text' then
-- 		if Sautofill then
-- 			Mchar = 'Σ'
-- 		end
-- 	end
-- 	return Achar .. Mchar .. Schar
-- end
-- -- }}}

-- -- split sym {{{
-- local function ShowSplitMode()
-- 	if WindowStyle then
-- 		return WindowStyle:sub(1,length)
-- 	else
-- 		return ''
-- 	end
-- end
-- -- }}}

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
-- -- top-line {{{
-- ---- sep {{{
-- --topinsert_left_a {
-- --	function()
-- --		return '▊'
-- --	end,
-- --	color = { fg = color.blue }, -- Sets highlighting of component
-- --	padding = { left = 0, right = 0 }, -- We don't need space before this
-- --}
-- ---- }}}
--
--
-- topinsert_left_c {
-- 	'buffers',
-- } -- autofill char
-- topinsert_right_x {'tabs'}
--
-- ---- sep {{{
-- --topinsert_right_z {
-- --	function()
-- --		return '▊'
-- --	end,
-- --	color = { fg = color.blue }, -- Sets highlighting of component
-- --	padding = { left = 0, right = 0 }, -- We don't need space before this
-- --}
-- ---- }}}
--
-- -- }}}
-- --
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

-- -- sep {{{
-- botinsert_left_a {
-- 	function()
-- 		return ' '
-- 	end,
-- --	color = { fg = color.blue }, -- Sets highlighting of component
-- 	padding = { left = 0, right = 0 }, -- We don't need space before this
-- }
-- -- }}}

-- icon {{{
local function get_line(filename)
	local i = 0
	for line in io.lines(filename) do
		i = i + 1

		local stat = string.find(line, '^ID=')
		if stat ~= nil then
			line = string.gsub(line, 'ID=', '')
			line = string.gsub(line, '"', '')
			return line
		end
	end
	return nil -- line not found
end

botinsert_left_a {
	function()
-- 		local icon = {
-- 			alpine = '',
-- 			arch = '',
-- 			artix = '',
-- 			debian = '',
-- 			freebsd = '',
-- 			kali = '',
-- 			linuxmint = '',
-- 			manjaro = '',
-- 			nixos = '',
-- 			openbsd = '',
-- 			slackware = '',
-- 			ubuntu = '',
-- 			void = '',
-- 			none = '',
-- --			arcolinux = '',
-- --			elementary = '',
-- --			fedora = '',
-- --			gentoo = '',
-- --			parrot = '',
-- --			popos = '',
-- --			redhat = '󱄛',
-- --			rocky = '',
-- --			solus = '',
-- --			zorin = '',
-- --			archlabs = '',
-- --			XXX = '',
-- --			XXX = '',
-- --			XXX = '',
-- --			XXX = '',
-- --			XXX = '',
-- 		}
--
-- 		local dist = get_line("/etc/os-release")
-- 		if icon[dist] == nil then
-- 			dist = 'freebsd'
-- 		end
-- 		return icon[dist]

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

-- mode {{{
botinsert_left_b {
'mode',
fmt = function(str)
	return string.lower(str)
	-- return str:sub(1,length)
end
}
-- }}}

botinsert_left_b {
	-- git branch
	'branch',
	icon = 'git:',
	-- icon = '',
--	color = { fg = color.violet, gui = 'bold' },
}
botinsert_left_c { basename } -- base dir
botinsert_left_c { 'filename' } -- filename
--botinsert_left_c {'%m'} -- modified sym


-- botinsert_right_x {
-- 	-- size
-- 	'filesize',
-- 	cond = conditions.buffer_not_empty,
-- }

botinsert_right_x {'%l:%L:%c'} -- cursor position

-- botinsert_right_x { -- enconding
-- 	"%{''.(&fenc!=''?&fenc:&enc).''}"
-- }

botinsert_right_x { -- fileformat
	'fileformat',
	symbols = {
		-- unix = '', -- e712
		-- dos = '',  -- e70f
		-- mac = '',  -- e711
		unix = 'LF',
		dos  = 'LFCR',
		mac  = 'CR',
	}
}

-- git-diff {{{
botinsert_right_x {
	'diff',
	-- Is it me or the symbol for modified us really weird
--	symbols = { added = ' ', modified = '柳', removed = ' ' },
	diff_color = {
		removed  = { fg = color.violet },
		modified = { fg = color.cyan },
		added    = { fg = color.orange },
	},
--	cond = conditions.hide_in_width,
}
-- }}}

-- diagnostics {{{
botinsert_right_x {
	'diagnostics',
	sources = { 'nvim_diagnostic' },
	sections = { "error", "warn", "info", "hint" },
	symbols = { error = 'x', warn = '!', info = '?', hint = '*' },
	diagnostics_color = {
		error = { fg = color.red },
		warn  = { fg = color.orange },
		info  = { fg = color.cyan },
		hint  = { fg = color.white },
	},
}
-- }}}

-- lsp server name {{{
botinsert_right_y {
	function()
		local msg = ''
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

-- filetype {{{
-- no icon
botinsert_right_y {currfiletype} -- file type
-- -- with icon
-- botinsert_right_y {
-- 	'filetype',
-- 	colored = false,
-- 	icon_only = false,
-- 	icon = { align = 'left' }
-- }
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

-- -- sep {{{
-- botinsert_right_z {
-- 	function()
-- 		return ' '
-- 	end,
-- --	color = { fg = color.blue }, -- Sets highlighting of component
-- 	padding = { left = 0, right = 0 }, -- We don't need space before this
-- }
-- -- }}}

-- vim icon {{{
botinsert_right_z {
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

-- botinsert_right_z {'progress'} -- file progress

-- }}}
-- }}}

-- separators {{{
local separators = {
	none        = { left = '',   right = ''   },
	single      = { left = '›',  right = '‹'  },
	double      = { left = '»',  right = '«'  },
	long        = { left = '⟩',  right = '⟨'  },
	ascii       = { left = '>',  right = '<'  },
	sharp       = { left = '',  right = ''  },
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
}

config.options.section_separators = separators.none
config.options.component_separators = separators.long
-- }}}

-- special theme {{{
if CurrentColorscheme == '256_noir' then
	config.options.theme = {
		normal = {
			a = { fg = color.red,   bg = color.bg,       gui = 'none' },
			b = { fg = color.fg,    bg = color.bg,       gui = 'none' },
			c = { fg = color.fg,    bg = color.bg,       gui = 'none' },
			x = { fg = color.fg,    bg = color.bg,       gui = 'none' },
			y = { fg = color.bg,    bg = color.special,  gui = 'none' },
			z = { fg = color.bg,    bg = color.special,  gui = 'none' },
		},
		insert = {
			a = { fg = color.red,   bg = color.bg,       gui = 'none' },
			b = { fg = color.fg,    bg = color.bg,       gui = 'none' },
			c = { fg = color.fg,    bg = color.bg,       gui = 'none' },
			x = { fg = color.fg,    bg = color.bg,       gui = 'none' },
			y = { fg = color.bg,    bg = color.special,  gui = 'none' },
			z = { fg = color.bg,    bg = color.special,  gui = 'none' },
		},
		visual = {
			a = { fg = color.red,   bg = color.bg,       gui = 'none' },
			b = { fg = color.fg,    bg = color.bg,       gui = 'none' },
			c = { fg = color.fg,    bg = color.bg,       gui = 'none' },
			x = { fg = color.fg,    bg = color.bg,       gui = 'none' },
			y = { fg = color.bg,    bg = color.special,  gui = 'none' },
			z = { fg = color.bg,    bg = color.special,  gui = 'none' },
		},
		replace = {
			a = { fg = color.red,   bg = color.bg,       gui = 'none' },
			b = { fg = color.fg,    bg = color.bg,       gui = 'none' },
			c = { fg = color.fg,    bg = color.bg,       gui = 'none' },
			x = { fg = color.fg,    bg = color.bg,       gui = 'none' },
			y = { fg = color.bg,    bg = color.special,  gui = 'none' },
			z = { fg = color.bg,    bg = color.special,  gui = 'none' },
		},
		command = {
			a = { fg = color.red,   bg = color.bg,       gui = 'none' },
			b = { fg = color.fg,    bg = color.bg,       gui = 'none' },
			c = { fg = color.fg,    bg = color.bg,       gui = 'none' },
			x = { fg = color.fg,    bg = color.bg,       gui = 'none' },
			y = { fg = color.bg,    bg = color.special,  gui = 'none' },
			z = { fg = color.bg,    bg = color.special,  gui = 'none' },
		},
	}
end
-- }}}

require('lualine').setup(config)
